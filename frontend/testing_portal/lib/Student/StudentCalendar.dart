import 'package:flutter/material.dart';
import 'package:testing_portal/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_portal/Student/StudentLoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:testing_portal/Student/StudentDashboard.dart';
import 'package:testing_portal/Student/StudentSupport.dart';

class StudentCalendar extends StatefulWidget {
  const StudentCalendar({Key? key}) : super(key: key);

  @override
  State<StudentCalendar> createState() => _StudentCalendarState();
}

class _StudentCalendarState extends State<StudentCalendar> {
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
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  StudentDashboard()),
                                  );
                                },
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                    backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))
                                ),
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
                                    MaterialPageRoute(builder: (context) =>  StudentCalendar()),
                                  );
                                },
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                    backgroundColor:hover == true ? MaterialStateProperty.all(Colors.white70.withOpacity(0.2)) : MaterialStateProperty.all(Colors.redAccent.withOpacity(0.4))
                                ),
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
