import 'package:testing_portal/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_portal/Admin/AdminDashboard.dart';
import 'package:testing_portal/Admin/AdminCalendar.dart';
import 'package:testing_portal/Admin/AdminAnalysis.dart';
import 'package:testing_portal/Admin/AdminSectorSkillCouncils.dart';
import 'package:testing_portal/Admin/AdminQPsNos.dart';
import 'package:testing_portal/Admin/AdminBatches.dart';
import 'package:testing_portal/Admin/AdminAssessors.dart';
import 'package:testing_portal/Admin/AdminAssessments.dart';
import 'package:testing_portal/Admin/AdminTrainingCenters.dart';
import 'package:testing_portal/Admin/AdminReports.dart';
import 'package:testing_portal/Admin/AdminResults.dart';
import 'package:testing_portal/Admin/AdminQuestionPapers.dart';
import 'package:testing_portal/Admin/AdminQuestions.dart';
import 'package:testing_portal/Admin/AdminMasters.dart';

class AdminAssessors extends StatefulWidget {
  const AdminAssessors({Key? key}) : super(key: key);

  @override
  State<AdminAssessors> createState() => _AdminAssessorsState();
}

class _AdminAssessorsState extends State<AdminAssessors> {
  bool hover = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      child: IntrinsicWidth(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 8.0,),
                                Image(image: AssetImage('images/Logo.png'),
                                  width: 50.0,
                                  height: 50.0,
                                  color: Colors.greenAccent,),
                                Text(
                                  'Portal',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(fontSize: 18,
                                      letterSpacing: 1.5,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0,),
                            MouseRegion(
                              onEnter: (h) {
                                setState(() {
                                  hover = true;
                                });
                              },
                              onExit: (h) {
                                setState(() {
                                  hover = false;
                                });
                              },
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdminDashboard()),
                                  );
                                },
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white70.withOpacity(0.2))),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10.0,),
                                    Icon(CupertinoIcons.speedometer,
                                      color: Colors.black, size: 20.0,),
                                    SizedBox(height: 40.0, width: 8.0,),
                                    Text('Dashboard'
                                        '            ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(fontSize: 14,
                                          letterSpacing: 1.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),


                            SizedBox(height: 3.0,),

                            MouseRegion(
                              onEnter: (h) {
                                setState(() {
                                  hover = false;
                                });
                              },
                              onExit: (h) {
                                setState(() {
                                  hover = true;
                                });
                              },
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdminCalendar()),
                                  );
                                },
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white70.withOpacity(0.2))),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10.0,),
                                    Icon(CupertinoIcons.calendar,
                                      color: Colors.black, size: 20.0,),
                                    SizedBox(height: 40.0, width: 8.0,),
                                    Text('Calendar          '
                                        '              ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(fontSize: 14,
                                          letterSpacing: 1.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 3.0,),
                            MouseRegion(
                              onEnter: (h) {
                                setState(() {
                                  hover = false;
                                });
                              },
                              onExit: (h) {
                                setState(() {
                                  hover = true;
                                });
                              },
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        AdminSectorSkillCouncils()),
                                  );
                                },
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white70.withOpacity(0.2))),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10.0,),
                                    Icon(
                                      CupertinoIcons.globe, color: Colors.black,
                                      size: 20.0,),
                                    SizedBox(height: 40.0, width: 8.0,),
                                    Text('Sector Skill Councils',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(fontSize: 14,
                                          letterSpacing: 1.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,),

                                      ),

                                    ),

                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 3.0,),
                            MouseRegion(
                              onEnter: (h) {
                                setState(() {
                                  hover = false;
                                });
                              },

                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdminQPsNos()),
                                  );
                                },
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white70.withOpacity(0.2))),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10.0,),
                                    Icon(
                                      CupertinoIcons.gauge, color: Colors.black,
                                      size: 20.0,),
                                    SizedBox(height: 40.0, width: 8.0,),
                                    Text('QPs & NOs      '
                                        '          ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(fontSize: 14,
                                          letterSpacing: 1.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 3.0,),
                            MouseRegion(
                              onEnter: (h) {
                                setState(() {
                                  hover = true;
                                });
                              },
                              onExit: (h) {
                                setState(() {
                                  hover = false;
                                });
                              },
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdminAssessors()),
                                  );
                                },
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                    backgroundColor: hover == true ? MaterialStateProperty.all(Colors.white70.withOpacity(0.2)) : MaterialStateProperty.all(Colors.redAccent.withOpacity(0.4))
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10.0,),
                                    Icon(CupertinoIcons.group_solid,
                                      color: Colors.black, size: 20.0,),
                                    SizedBox(height: 40.0, width: 8.0,),
                                    Text('Assessors        '
                                        '           ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(fontSize: 14,
                                          letterSpacing: 1.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 3.0,),
                            MouseRegion(
                              onEnter: (h) {
                                setState(() {
                                  hover = false;
                                });
                              },
                              onExit: (h) {
                                setState(() {
                                  hover = true;
                                });
                              },
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdminBatches()),
                                  );
                                },
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white70.withOpacity(0.2))),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10.0,),
                                    Icon(CupertinoIcons
                                        .rectangle_on_rectangle_angled,
                                      color: Colors.black, size: 20.0,),
                                    SizedBox(height: 40.0, width: 8.0,),
                                    Text('Batches          '
                                        '      ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(fontSize: 14,
                                          letterSpacing: 1.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 3.0,),
                            MouseRegion(
                              onEnter: (h) {
                                setState(() {
                                  hover = false;
                                });
                              },
                              onExit: (h) {
                                setState(() {
                                  hover = true;
                                });
                              },
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        AdminAssessments()),
                                  );
                                },
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white70.withOpacity(0.2))),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10.0,),
                                    Icon(CupertinoIcons.doc_text,
                                      color: Colors.black, size: 20.0,),
                                    SizedBox(height: 40.0, width: 8.0,),
                                    Text('Assessments          ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(fontSize: 14,
                                          letterSpacing: 1.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 3.0,),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      AdminTrainingCenters()),
                                );
                              },
                              style:
                              ButtonStyle(shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0,),
                                  Icon(CupertinoIcons.person_crop_rectangle,
                                    color: Colors.black, size: 20.0,),
                                  SizedBox(height: 40.0, width: 8.0,),
                                  Text('Training Centres     '
                                      '          ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,),

                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 3.0,),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminResults()),
                                );
                              },
                              style:
                              ButtonStyle(shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0,),
                                  Icon(CupertinoIcons.check_mark_circled,
                                    color: Colors.black, size: 20.0,),
                                  SizedBox(height: 40.0, width: 8.0,),
                                  Text('Results              ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,),

                                    ),

                                  ),

                                ],
                              ),
                            ),

                            SizedBox(height: 3.0,),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminQuestions()),
                                );
                              },
                              style:
                              ButtonStyle(shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0,),
                                  Icon(
                                    CupertinoIcons.command, color: Colors.black,
                                    size: 20.0,),
                                  SizedBox(height: 40.0, width: 8.0,),
                                  Text('Questions            ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,),

                                    ),

                                  ),

                                ],
                              ),
                            ),

                            SizedBox(height: 3.0,),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      AdminQuestionPapers()),
                                );
                              },
                              style:
                              ButtonStyle(shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0,),
                                  Icon(CupertinoIcons.doc_plaintext,
                                    color: Colors.black, size: 20.0,),
                                  SizedBox(height: 40.0, width: 8.0,),
                                  Text('Question Papers      ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,),

                                    ),

                                  ),

                                ],
                              ),
                            ),

                            SizedBox(height: 3.0,),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminAnalysis()),
                                );
                              },
                              style:
                              ButtonStyle(shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0,),
                                  Icon(CupertinoIcons.chart_bar_square,
                                    color: Colors.black, size: 20.0,),
                                  SizedBox(height: 40.0, width: 8.0,),
                                  Text('Analysis             ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,),

                                    ),

                                  ),

                                ],
                              ),
                            ),

                            SizedBox(height: 3.0,),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminReports()),
                                );
                              },
                              style:
                              ButtonStyle(shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0,),
                                  Icon(CupertinoIcons.square_list,
                                    color: Colors.black, size: 20.0,),
                                  SizedBox(height: 40.0, width: 8.0,),
                                  Text('Reports              ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,),

                                    ),

                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 3.0,),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminMasters()),
                                );
                              },
                              style:
                              ButtonStyle(shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0,),
                                  Icon(
                                    CupertinoIcons.layers, color: Colors.black,
                                    size: 20.0,),
                                  SizedBox(height: 40.0, width: 8.0,),
                                  Text('Masters              ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,),

                                    ),

                                  ),

                                ],
                              ),
                            ),

                            SizedBox(height: 3.0,),
                            TextButton(

                              onPressed: () {},
                              style:
                              ButtonStyle(shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0,),
                                  Icon(CupertinoIcons.gear, color: Colors.black,
                                    size: 20.0,),
                                  SizedBox(height: 40.0, width: 8.0,),
                                  Text('Settings              ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,),

                                    ),

                                  ),

                                ],
                              ),
                            ),


                            SizedBox(height: 10.0,),

                            SizedBox(
                              height: 40.0,
                              child: Row(
                                children: [
                                  SizedBox(width: 30.0,),
                                  ElevatedButton(child: Text(
                                    'Logout ',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(fontSize: 12,
                                          letterSpacing: 0.5,
                                          color: Colors.white),
                                    ),
                                  ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            5.0),
                                      ),
                                      primary: Colors.redAccent,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage()),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ],

        ),

      ),
    );
  }
}
