import 'package:flutter/material.dart';
import 'package:testing_portal/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_portal/Student/StudentLoginScreen.dart';
import 'package:flutter/cupertino.dart';

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
                              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.gear_big, color: Colors.black, size: 30.0,),),
                              SizedBox(width: 25.0,),
                              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.person_circle, color: Colors.redAccent, size: 30.0,),)
                            ],
                          ),
                        ),
                        Center(
                          child: Row(
                            children: [
                              Column(

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

