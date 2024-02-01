import 'package:flutter/material.dart';
import 'package:testing_portal/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_portal/Student/StudentLoginScreen.dart';
import 'package:flutter/cupertino.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  bool hover = true;
  var name;
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
                              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.gear_big, color: Colors.black, size: 30.0,),),
                              SizedBox(width: 25.0,),
                              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.person_circle, color: Colors.redAccent, size: 30.0,),)
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        SizedBox(
                            width: 1240.0,
                            height: 250.0,
                            child: Card(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  gradient: LinearGradient(
                                    colors: [Colors.redAccent.withOpacity(1.0),Colors.redAccent.withOpacity(0.9),Colors.redAccent.withOpacity(0.8), Colors.pinkAccent.withOpacity(0.4)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          //  Add Date API
                                          SizedBox(height: 120.0,),
                                          Text('     Welcome back, $name!',
                                            style: GoogleFonts.poppins(
                                            textStyle: TextStyle(fontSize: 32, letterSpacing: 1.5, color: Colors.white, fontWeight: FontWeight.w600,),
                                          ),
                                          ),
                                          Text('        Always stay updated in your student portal',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(fontSize: 15, letterSpacing: 1.5, color: Colors.white, fontWeight: FontWeight.w200,),
                                            ),
                                          ),
                                        ],
                                      ),
                                    //  Add image
                                      SizedBox(width: 300.0,),
                                      Image(image: AssetImage('images/ill.png',
                                      ), height: 950.0,width: 500.0,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                        SizedBox(height: 30.0,),
                        SizedBox(
                          //Add scrolling view
                          width: 1240.0,
                          height: 160.0,
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
                                 Text('   Today Assessments',
                                    style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 0.4, color: Colors.black),
                                    ),
                                  ),
                                SingleChildScrollView(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text('     Assessment Details',
                                            style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.6, color: Colors.grey),
                                            ),
                                              // Call Time function
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        SizedBox(
                          //Add scrolling view
                          width: 1240.0,
                          height: 140.0,
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
                                Text('   Upcoming Assessments',
                                  style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 0.4, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
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
