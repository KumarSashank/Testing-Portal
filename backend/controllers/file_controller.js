`use strict`;

const db = require("../db");
const firebase = require("firebase-admin");
const xlsx = require("xlsx");
const fs = require("fs");
const util = require("util");
const unlinkAsync = util.promisify(fs.unlink);
// const admin = require("firebase-admin");

const firestore = db;

async function uploadQuestionPapers(file, SSC, QPS, cutoff) {
  //generating a name for question paper by adding date to QPS
  // const nameWithDate = generateNameWithDate(QPS);

  //extracting data from excel file
  const workbook = readExcelFile(file);
  const data = extractDataFromWorkbook(workbook);

  //Getting QP count from uploading question paper data
  const QPS_paper_count = await uploadQuestionPaperData2(
    QPS,
    SSC,
    data,
    cutoff
  ); //uploading data to firestore

  const filename = QPS + "-" + QPS_paper_count;
  const url = await uploadFileToStorage(file, "Question_Papers", filename);
  // const questionPaperRef = await getQuestionPaperReference(SSC, QPS);

  // const questionsCollectionPath = await createQuestionPaperDocument(
  //   QPS,
  //   file.originalname,
  //   url,
  //   SSC,
  //   QPS
  // );

  const new_qp_id = QPS_paper_count + 1;
  return {
    url: url,
    filename: file.originalname,
    SSC: SSC,
    QPS: QPS,
    question_paper_id: new_qp_id,
  };
}

function generateNameWithDate(QPS) {
  const currentDate = new Date();
  const formattedDate = currentDate.toISOString().split("T")[0];
  return QPS + "-" + formattedDate;
}

function readExcelFile(file) {
  return xlsx.readFile(file.path);
}

function extractDataFromWorkbook(workbook) {
  const sheetName = workbook.SheetNames[0];
  const worksheet = workbook.Sheets[sheetName];
  return xlsx.utils.sheet_to_json(worksheet);
}

async function uploadQuestionPaperData(nameWithDate, SSC, data) {
  try {
    await firestore.collection("question_papers").doc(nameWithDate).set({
      updatedAt: new Date(),
      ssc: SSC,
      qps: nameWithDate,
    });

    //getting ref of question paper
    const qpsRef = firestore.collection("question_papers").doc(nameWithDate);

    //adding questions from data(object array)
    for (const question of data) {
      await qpsRef.collection("questions").add(question);
      console.log("Question uploaded successfully:", question.Question);
    }
  } catch (error) {
    console.error("Error uploading question:", error);
    throw error;
  }
}

//checking gpt
async function uploadQuestionPaperData2(QPS, SSC, data, cutoff) {
  try {
    // Reference to the document
    const qpsRef = firestore.collection("question_papers").doc(QPS);
    let isNewDocument = false; // Flag to check if the document is newly created

    // Attempt to get the document
    const doc = await qpsRef.get();
    console.log(doc);

    if (!doc.exists) {
      // Document does not exist, so create it and initialize the 'papers' collection if needed
      await qpsRef.set({
        updatedAt: new Date(),
        ssc: SSC,
        qps: QPS,
        question_papers: 0,
      });
      console.log("Document created with initial data:", QPS);
      isNewDocument = true;
    } else {
      console.log(
        "Document exists, navigating to 'papers' subcollection:",
        QPS
      );
    }

    // Reference to the 'papers' subcollection within the document
    const papersRef = qpsRef.collection("papers");

    //get the question_papers value from QPS doc field
    const QPS_paper_doc = await firestore
      .collection("question_papers")
      .doc(QPS)
      .get();

    //Getting the total papers count
    console.log(QPS_paper_doc.data().question_papers);
    const paperNumber = QPS_paper_doc.data().question_papers;
    let newpaper = paperNumber + 1;

    //adding total questions count in field
    await papersRef
      .doc(newpaper.toString())
      .set({ "Total questions": data.length, cutoff: cutoff });

    // Get the reference to the questions subcollection
    const questionsRef = papersRef
      .doc(newpaper.toString())
      .collection("questions");

    let itemId = 1; // Start with an ID of 1

    // Add each question to the 'questions' subcollection
    for (const question of data) {
      await questionsRef.doc(itemId.toString()).set(question); // Convert itemId to a string
      console.log("Question uploaded successfully:", question.Question);
      itemId++; // Increment the itemId for the next document
    }

    //updating question paper count
    await qpsRef.update({ question_papers: newpaper });
    QPS_paper_count = newpaper;

    console.log("Count Updated", newpaper);

    console.log("Question Papers: ");
    console.log(data);

    return newpaper;
  } catch (error) {
    console.error("Error in operation:", error);
    throw error;
  }
}

async function uploadStudentsData(batchid, data, QPS) {
  try {
    const batchname = batchid + QPS;
    const batchref = await firestore.collection("Batches").doc(batchid);
    var num = 1;
    for (const student of data) {
      studentid = batchname + num++;
      const studentRef = await batchref.collection("students").doc(studentid);
      await studentRef.set(student);
      console.log("Student uploaded successfully:", student.Name);
    }
  } catch (err) {
    console.error("Error uploading student:", error);
    throw error;
  }
}

async function uploadFileToStorage(file, folder, filename) {
  //uploading file to firebase storage
  const bucket = firebase.storage().bucket();
  const destinationPath = folder + "/" + filename;
  await bucket.upload(file.path, { destination: destinationPath });
  const [url] = await bucket.file(destinationPath).getSignedUrl({
    action: "read",
    expires: "03-09-2491",
  });
  return url;
}

// async function getQuestionPaperReference(SSC, QPS) {
//   const sscDoc = await firestore.collection("SSC").doc(SSC).get();
//   return sscDoc.ref.collection("QPS").doc(QPS).ref;
// }

// async function createQuestionPaperDocument(
//   nameWithDate,
//   filename,
//   url,
//   questionPaperRef,
//   SSC,
//   QPS
// ) {
//   try {
//     const sscDoc = await firestore.collection("SSC").doc(SSC).get();
//     const qpsDoc = await sscDoc.ref.collection("QPS").doc(QPS).get();

//     //Need to check the question was already uploaded or not
//     const questionsCollectionPath = `question_papers/${nameWithDate}/questions`;

//     await qpsDoc.ref.collection("questionpapers").doc(nameWithDate).set({
//       createdAt: new Date(),
//       filename: filename,
//       url: url,
//       path: questionsCollectionPath,
//     });

//     // Return the path to the questions collection
//     return questionsCollectionPath;
//   } catch (error) {
//     console.error("Error creating question paper document:", error);
//     throw error;
//   }
// }

module.exports.uploadController = async (req, res) => {
  try {
    const file = req.file;
    //checking whether file is uploaded to server or not
    if (!file) {
      return res.status(400).send("No file uploaded.");
    }

    const { SSC, QPS, cutoff } = req.body;
    console.log(SSC);
    console.log(QPS);

    //calling uploadquestionpapers function
    const responseJson = await uploadQuestionPapers(file, SSC, QPS, cutoff);

    // Delete the uploaded file after the total process completed
    await unlinkAsync(file.path);
    console.log("Uploaded file deleted successfully.");

    return res.status(200).json(responseJson);
  } catch (error) {
    console.error("Error uploading file:", error);
    res.status(500).send("Internal Server Error");
  }
};

//creating batch
module.exports.createBatch = async (req, res) => {
  try {
    const file = req.file;
    if (!file) {
      return res.status(400).send("No file uploaded.");
    }

    const { SSC, QPS, qpNo } = req.body;
    //taking remaining data like test center
    const {
      batchName,
      batchSize,
      project,
      trainingCentre,
      state,
      spocContactNo,
      centerAddress,
      assessmentStartDate,
      assessmentEndDate,
      loginRestrictCount,
      modeOfAssessment,
      centerId,
      district,
      spocEmailId,
      tpName,
      startTime,
      endTime,
    } = req.body;

    const batchdata = {
      SSC,
      batchName,
      batchSize,
      project,
      trainingCentre,
      state,
      spocContactNo,
      centerAddress,
      assessmentStartDate,
      assessmentEndDate,
      loginRestrictCount,
      modeOfAssessment,
      centerId,
      district,
      spocEmailId,
      tpName,
      startTime,
      endTime,
      QPS,
      qpNo,
    };

    if (!batchName || !trainingCentre) {
      return res.status(400).send({ message: "Required fields are missing" });
    }
    const workbook = readExcelFile(file);
    const data = extractDataFromWorkbook(workbook);

    const batchdoc = await firestore
      .collection("metaData")
      .doc("batches")
      .get();
    var lastbatchNum = batchdoc.data().LastBatchNum;
    console.log(lastbatchNum);

    var batchid = "B" + ++lastbatchNum;
    console.log(batchid);

    console.log(lastbatchNum);

    const filename = batchid + ".xlsx";

    const url = await uploadFileToStorage(file, "students_list", filename);

    await uploadStudentsData(batchid, data, QPS);

    //adding batch data
    const batchRef = firestore.collection("Batches").doc(batchid);
    //set the values for batchRef
    batchRef.set(batchdata);

    //updating the latest batch count
    await firestore
      .collection("metaData")
      .doc("batches")
      .update({ LastBatchNum: lastbatchNum });

    //adding this batch id in QPS data
    try {
      // Get a reference to the document
      const batchRef = firestore
        .collection("SSC")
        .doc(SSC)
        .collection("QPS")
        .doc(QPS);

      // Update the document
      await batchRef.update({
        batches: firebase.firestore.FieldValue.arrayUnion(batchid),
      });

      // Respond with success
    } catch (error) {
      console.error("Error adding batchID to the array:", error);
    }

    // Delete the uploaded file after the total process completed
    await unlinkAsync(file.path);
    console.log("Uploaded file deleted successfully.");

    return res.status(200).json({ Batch_id: batchid });
  } catch (error) {
    console.error("Error uploading file:", error);
    res.status(500).send("Internal Server Error");
  }
};

module.exports.uploadQuestions = async (req, res) => {
  try {
    const file = req.file;
    if (!file) {
      return res.status(400).send("No file uploaded.");
    }

    const { SSC } = req.body;

    const workbook = readExcelFile(file);
    const data = extractDataFromWorkbook(workbook);

    // Assuming groupQuestions is necessary for your process, otherwise skip.
    const groupedData = groupQuestions(data);

    await updateGroupedDataInFirestore(SSC, groupedData);

    const SSC_ref = await firestore.collection("SSC").doc(SSC).get();
    if (!SSC_ref.exists) {
      return res.status(400).send("Invalid SSC code");
    }

    const questionBankRef = await firestore
      .collection("metaData")
      .doc("question_bank")
      .get();
    let questions_count = questionBankRef.data().questions_count;

    const questions_ref = firestore.collection("Questions");
    const batch = firestore.batch();

    data.forEach((question) => {
      questions_count++;
      const questionWithCount = {
        ...question,
        index: questions_count,
        SSC: SSC,
      };
      const docRef = questions_ref.doc(questions_count.toString());
      batch.set(docRef, questionWithCount);
    });

    await batch.commit();

    await firestore
      .collection("metaData")
      .doc("question_bank")
      .update({ questions_count });

    await unlinkAsync(file.path);

    return res.status(200).json({ message: "Questions uploaded successfully" });
  } catch (error) {
    console.error("Error uploading file:", error);
    res.status(500).send("Internal Server Error");
  }
};

module.exports.generateQP = async (req, res) => {
  const { SSC, QPS, questions_pattern } = req.body;
  try {
    const questionPaper = await generateQuestionPaper(questions_pattern);

    // Upload the generated question paper to Firestore
    // await uploadQuestionPaperData2(QPS, SSC, questionPaper);

    res.status(200).send(questionPaper);
  } catch (error) {
    console.error("Error generating question paper:", error);
    res.status(500).send("Internal Server Error");
  }
};

module.exports.addQP = async (req, res) => {
  const { SSC, QPS, questionPaper } = req.body;
  try {
    // Upload the generated question paper to Firestore
    const QPS_paper_count = await uploadQuestionPaperData2(
      QPS,
      SSC,
      questionPaper
    );

    //send the response that question paper created and its count
    return res.status(200).json({ QPS_paper_count: QPS_paper_count });
  } catch (error) {
    console.error("Error generating question paper:", error);
    res.status(500).send("Internal Server Error");
  }
};

module.exports.getQuestionsGroupCount = async (req, res) => {
  try {
    const { SSC } = req.body;
    console.log("SSC : ", SSC);

    const questionsRef = await firestore.collection("SSC").doc(SSC).get();
    const data = questionsRef.data();
    const groupedData = data.groupedData;
    console.log(data);
    // const questionsGroupCount = questionsRef.data().groupedData;
    res.status(200).json(groupedData);
  } catch (error) {
    console.error("Error getting questions count:", error);
    res.status(500).send("Internal Server Error");
  }
};

module.exports.getQuestionBank = async (req, res) => {
  try {
    const { SSC } = req.body;
    const questionsRef = await firestore
      .collection("Questions")
      .where("SSC", "==", SSC)
      .get();
    const questions = [];
    questionsRef.forEach((doc) => {
      questions.push(doc.data());
    });
    res.status(200).json(questions);
  } catch (error) {
    console.error("Error getting questions:", error);
    res.status(500).send("Internal Server Error");
  }
};

module.exports.editQuestionQBank = async (req, res) => {
  //get the index number and edit the question and option, and can upload images for question ans options
  const { index, data } = req.body;
  console.log("index : ", index);
  console.log("data : ", data);
  try {
    const questionsRef = firestore.collection("Questions");
    const questionRef = questionsRef.doc(index.toString());
    //update question and options and can add other fields of image links individually
    await questionRef.update({
      Question: data.Question,
      Option1: data.Option1,
      Option2: data.Option2,
      Option3: data.Option3,
      Option4: data.Option4,
      ANS: data.ANS,
      question_img: data.question_img,
      option1_img: data.option1_img,
      option2_img: data.option2_img,
      option3_img: data.option3_img,
      option4_img: data.option4_img,
    });
    res.status(200).send("Question updated successfully");
  } catch (error) {
    console.error("Error updating question:", error);
    res.status(500).send("Internal Server Error");
  }
};

module.exports.editQuestionQP = async (req, res) => {
  try {
    const { QPS, qpNo, Qnum, data } = req.body;
    const qpsRef = firestore.collection("question_papers").doc(QPS);
    const papersRef = qpsRef.collection("papers").doc(qpNo.toString());
    const questionsRef = papersRef.collection("questions");
    const questionRef = questionsRef.doc(Qnum.toString());
    await questionRef.update({
      Question: data.Question,
      Option1: data.Option1,
      Option2: data.Option2,
      Option3: data.Option3,
      Option4: data.Option4,
      ANS: data.ANS,
      question_img: data.question_img,
      option1_img: data.option1_img,
      option2_img: data.option2_img,
      option3_img: data.option3_img,
      option4_img: data.option4_img,
    });

    //send the response Question num updated
    return res
      .status(200)
      .json({ message: "Question Updated Successfully", Question_num: Qnum });
  } catch (error) {
    console.error("Error updating question paper:", error);
    res.status(500).send("Internal Server Error");
  }
};

module.exports.getQuestionPaperList = async (req, res) => {
  try {
    const { SSC, QPS } = req.body;
    const qpsRef = firestore.collection("question_papers").doc(QPS);
    const papersRef = qpsRef.collection("papers");
    const papers = [];
    const snapshot = await papersRef.get();
    snapshot.forEach((doc) => {
      //add id and doc.data in an object
      let obj = {};
      obj.id = doc.id;
      obj.data = doc.data();
      papers.push(obj);
    });
    return res.status(200).json(papers);
  } catch (error) {
    console.error("Error getting question paper list:", error);
    res.status(500).send("Internal Server Error");
  }
};

//use to upload images in edit section of a question
module.exports.uploadQuestionImage = async (req, res) => {
  try {
    const file = req.file;
    if (!file) {
      return res.status(400).send("No file uploaded.");
    }

    //unique filename generator with time and data and .png
    const filename = new Date().getTime() + ".png";

    const url = await uploadFileToStorage(file, "questions_images", filename);
    console.log("url : ", url);

    return res.status(200).json({ url: url });
  } catch (error) {
    console.error("Error uploading file:", error);
    res.status(500).send("Internal Server Error");
  }
};

async function generateQuestionPaper(questionsPattern) {
  let questionPaper = [];

  for (const nosItem of questionsPattern) {
    const allQuestions = await fetchQuestionsForNOS(nosItem.NOS);

    let nosQuestions = [];
    for (const pattern of nosItem.pattern) {
      const filteredQuestions = allQuestions.filter(
        (q) => q.Marks === pattern.Marks
      );
      const shuffledQuestions = shuffleArray(filteredQuestions);
      const randomQuestions = shuffledQuestions.slice(0, pattern.Count);

      // Transform each question to the desired format here if needed
      nosQuestions = nosQuestions.concat(randomQuestions);
    }

    // Transform nosQuestions to include additional details if necessary
    const detailedQuestions = nosQuestions.map((q, index) => ({
      "s.no": index + 1,
      Question: q.Question.trim(),
      Option1: q.Option1.trim(),
      Option2: q.Option2.trim(),
      Option3: q.Option3.trim(),
      Option4: q.Option4.trim(),
      ANS: q.ANS,
      Noofoptions: 4, // Assuming all questions have 4 options, adjust as necessary
      QuestionTypeID: q.QuestionTypeID,
      QuestionLevelID: q.QuestionLevelID,
      PCID: q.PCID,
      Marks: q.Marks,
      NOS: q.NOS,
    }));

    questionPaper = questionPaper.concat(detailedQuestions);
  }
  // After all questions have been added to questionPaper
  questionPaper.forEach((question, index) => {
    question["s.no"] = index + 1; // Update s.no based on the question's position in the array
  });

  console.log(questionPaper);
  return questionPaper;
}
function shuffleArray(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]]; // Swap elements
  }
  return array;
}

async function fetchQuestionsForNOS(NOS) {
  const questionsRef = firestore.collection("Questions");
  const querySnapshot = await questionsRef.where("NOS", "==", NOS).get();
  const questions = [];
  querySnapshot.forEach((doc) => {
    questions.push(doc.data());
  });
  return questions;
}

function groupQuestions(data) {
  let groupedData = {};

  data.forEach((row) => {
    const { NOS, Marks } = row;
    if (!groupedData[NOS]) {
      groupedData[NOS] = {};
    }
    if (!groupedData[NOS][Marks]) {
      groupedData[NOS][Marks] = 0;
    }
    groupedData[NOS][Marks]++;
  });

  return groupedData;
}

async function updateGroupedDataInFirestore(SSC, groupedData) {
  try {
    const sscDocRef = db.collection("SSC").doc(SSC);
    const sscDocSnap = await sscDocRef.get();

    let existingGroupedData = {};
    if (sscDocSnap.exists) {
      existingGroupedData = sscDocSnap.data().groupedData || {};
    }

    const mergedGroupedData = mergeGroupedData(
      existingGroupedData,
      groupedData
    );

    await sscDocRef.set({ groupedData: mergedGroupedData }, { merge: true });
  } catch (error) {
    console.error("Error updating grouped data in Firestore:", error);
    throw error;
  }
}

function mergeGroupedData(existingData, newData) {
  for (const nos in newData) {
    if (!existingData[nos]) {
      existingData[nos] = {};
    }
    for (const mark in newData[nos]) {
      if (!existingData[nos][mark]) {
        existingData[nos][mark] = 0;
      }
      existingData[nos][mark] += newData[nos][mark];
    }
  }
  return existingData;
}

function groupQuestions(data) {
  let groupedData = {};

  data.forEach((row) => {
    const { NOS, Marks } = row;
    if (!groupedData[NOS]) {
      groupedData[NOS] = {};
    }
    if (!groupedData[NOS][Marks]) {
      groupedData[NOS][Marks] = 0;
    }
    groupedData[NOS][Marks]++;
  });

  return groupedData;
}

async function updateGroupedDataInFirestore(SSC, groupedData) {
  try {
    const sscDocRef = db.collection("SSC").doc(SSC);
    const sscDocSnap = await sscDocRef.get();

    let existingGroupedData = {};
    if (sscDocSnap.exists) {
      existingGroupedData = sscDocSnap.data().groupedData || {};
    }

    const mergedGroupedData = mergeGroupedData(
      existingGroupedData,
      groupedData
    );

    await sscDocRef.set({ groupedData: mergedGroupedData }, { merge: true });
  } catch (error) {
    console.error("Error updating grouped data in Firestore:", error);
    throw error;
  }
}

function mergeGroupedData(existingData, newData) {
  for (const nos in newData) {
    if (!existingData[nos]) {
      existingData[nos] = {};
    }
    for (const mark in newData[nos]) {
      if (!existingData[nos][mark]) {
        existingData[nos][mark] = 0;
      }
      existingData[nos][mark] += newData[nos][mark];
    }
  }
  return existingData;
}
