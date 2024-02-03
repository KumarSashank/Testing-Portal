import 'package:flutter/material.dart';
import 'package:testing_portal/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_portal/Student/StudentLoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:testing_portal/Student/ExamScreen.dart';

class StartExamScreen extends StatefulWidget {
  const StartExamScreen({Key? key}) : super(key: key);

  @override
  State<StartExamScreen> createState() => _StartExamScreenState();
}

class _StartExamScreenState extends State<StartExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.0,),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage('images/Logo.png'),
                                width: 40.0,
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
                              SizedBox(width: 70.0,),
                              Text(
                                  'Student Portal',
                                  style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: Colors.black),
                                  )),
                              SizedBox(width: 860.0,),

                              SizedBox(width: 25.0,),
                              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell, color: Colors.black, size: 30.0,),),
                              SizedBox(width: 25.0,),
                              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.headphones, color: Colors.black, size: 30.0,),),
                              SizedBox(width: 25.0,),
                              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.gear_big, color: Colors.black, size: 30.0,),),
                              SizedBox(width: 25.0,),
                              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.person_circle, color: Colors.redAccent, size: 30.0,),)
                            ],
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 300.0,
                                        width: 450.0,
                                        child: Container(
                                          child: Card(
                                            shadowColor: Colors.grey,
                                            surfaceTintColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 30.0,),
                                                Text(
                                                  '    Assessment Details',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(fontSize: 22,
                                                      letterSpacing: 0.5,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600,),
                                                  ),
                                                ),
                                                SizedBox(height: 20.0,),
                                                Row(
                                                  children: [
                                                    Text('      Date:   ',
                                                      style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(fontSize: 14,
                                                          letterSpacing: 0.5,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w600,),
                                                      ),
                                                    ),
                                                    //Present Date
                                                  ],
                                                ),
                                                SizedBox(height: 10.0,),
                                                Row(
                                                  children: [
                                                    Text('      Time:   ',
                                                      style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(fontSize: 14,
                                                          letterSpacing: 0.5,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w600,),
                                                      ),
                                                    ),
                                                    //Exam Timings
                                                  ],
                                                ),
                                                SizedBox(height: 10.0,),
                                                Row(
                                                  children: [
                                                    Text('      Batch:   ',
                                                      style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(fontSize: 14,
                                                          letterSpacing: 0.5,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w600,),
                                                      ),
                                                    ),
                                                    //Batch Code
                                                  ],
                                                ),
                                                SizedBox(height: 10.0,),
                                                Row(
                                                  children: [
                                                    Text('      SSC:   ',
                                                      style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(fontSize: 14,
                                                          letterSpacing: 0.5,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w600,),
                                                      ),
                                                    ),
                                                    //Sector Skill Council of exam
                                                  ],
                                                ),
                                                SizedBox(height: 10.0,),
                                                Row(
                                                  children: [
                                                    Text('      Job Role:   ',
                                                      style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(fontSize: 14,
                                                          letterSpacing: 0.5,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w600,),
                                                      ),
                                                    ),
                                                    //Job Role
                                                  ],
                                                ),
                                                SizedBox(height: 10.0,),
                                                Row(
                                                  children: [
                                                    Text('      Sector:   ',
                                                      style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(fontSize: 14,
                                                          letterSpacing: 0.5,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w600,),
                                                      ),
                                                    ),
                                                    //Dept. APSSDC
                                                  ],
                                                ),
                                                SizedBox(height: 10.0,),
                                                Row(
                                                  children: [
                                                    Text('      Assessor Name:   ',
                                                      style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(fontSize: 14,
                                                          letterSpacing: 0.5,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w600,),
                                                      ),
                                                    ),
                                                    //Assessor Name
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 30.0,),
                                      SizedBox(
                                        height: 280.0,
                                        width: 450.0,
                                        child: Container(
                                          child: Card(
                                            shadowColor: Colors.grey,
                                            surfaceTintColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 10.0,),
                                                Text(
                                                  '   Camera',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(fontSize: 22,
                                                      letterSpacing: 1.5,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600,),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(width: 30.0,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 350.0,
                                    width: 450.0,
                                    child: Container(
                                      child: Card(
                                        shadowColor: Colors.grey,
                                        surfaceTintColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '     Instructions',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(fontSize: 22,
                                                  letterSpacing: 0.5,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,),
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                ],
                                                //Add instructions
                                              ),
                                            ),
                                              ],
                                            ),
                                        ),
                                      ),
                                    ),
                                  SizedBox(height: 30.0,),
                                  SizedBox(
                                    height:30.0,
                                    child: ElevatedButton( child: Text(
                                      ' Start Exam  ',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(fontSize: 12, letterSpacing: 0.5, color: Colors.white),
                                      ),
                                    ),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        primary: Colors.redAccent,
                                      ),
                                      onPressed: () {Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const ExamScreen()),
                                      );
                                      },
                                    ),
                                  ),

                                ],
                              ),


                            ],
                          ),
                        ),
                      ],
                    )

                ),
              ),
            ),

          ],

        ),

      ),
    );
  }
}

