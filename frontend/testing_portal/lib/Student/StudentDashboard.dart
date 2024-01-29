import 'package:flutter/material.dart';
import 'package:testing_portal/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_portal/Student/StudentLoginScreen.dart';
import 'package:testing_portal/Student/StudentCalendar.dart';
import 'package:testing_portal/Student/StudentSupport.dart';
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
                                Image(image: AssetImage('images/Logo.png'), width: 50.0, height: 50.0, color: Colors.greenAccent, ),
                                Text(
                                  'Portal',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(fontSize: 18, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0,),
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
                                    MaterialPageRoute(builder: (context) =>  StudentDashboard()),
                                  );
                                },
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                    backgroundColor:hover == true ? MaterialStateProperty.all(Colors.white70.withOpacity(0.2)) : MaterialStateProperty.all(Colors.redAccent.withOpacity(0.4))),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10.0,),
                                    Icon(CupertinoIcons.speedometer,color: Colors.black,size: 20.0,),
                                    SizedBox(height: 40.0,width: 8.0,),
                                    Text('Dashboard'
                                        '            ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0,),
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
                                    MaterialPageRoute(builder: (context) =>  StudentCalendar()),
                                  );
                                },
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                    backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10.0,),
                                    Icon(CupertinoIcons.calendar,color: Colors.black,size: 20.0,),
                                    SizedBox(height: 40.0, width: 8.0,),
                                    Text('Calendar          '
                                        '              ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0,),
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
                                    MaterialPageRoute(builder: (context) =>  StudentSupport()),
                                  );
                                },
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                    backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10.0,),
                                    Icon(CupertinoIcons.headphones,color: Colors.black,size: 20.0,),
                                    SizedBox(height: 40.0, width: 8.0,),
                                    Text('Support         '
                                        '              ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 30.0,),
                            SizedBox(
                              height:40.0,
                              child: Row(
                                children: [
                                  SizedBox(width: 30.0,),
                                  ElevatedButton( child: Text(
                                    'Logout ',
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
                                      MaterialPageRoute(builder: (context) =>  MyHomePage()),
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
            Expanded(
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.0,),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                      SizedBox(height: 30.0,),
                      SizedBox(
                        width: 1240.0,
                        height: 200.0,
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
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      SizedBox(
                        width: 500.0,
                        height: 150.0,
                        child: Card(
                          shadowColor: Colors.grey,
                          surfaceTintColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.0,),
                               Text('  Upcoming Assessments',
                                  style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 0.4, color: Colors.black),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )

              ),
            ),

          ],

        ),

      ),
    );
  }
}
