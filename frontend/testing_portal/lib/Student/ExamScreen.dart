import 'package:flutter/material.dart';
import 'package:testing_portal/Student/StudentDashboard.dart';
import 'package:testing_portal/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_portal/Student/StudentLoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:testing_portal/Student/FinishExam.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
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
                        Row(
                          children: [
                            SizedBox(width: 50.0,),
                            Column(
                              children: [
                                SizedBox(
                                  width: 950.0,
                                  height: 100.0,
                                  child: Container(
                                    child: Card(
                                      shadowColor: Colors.grey,
                                      surfaceTintColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 40.0,),
                                          Text('Section:',
                                              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.4, color: Colors.black),
                                              ),),//Aptitude or Technical
                                          SizedBox(width: 100.0,),
                                          Text('Total: ', //number of questions
                                            style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.4, color: Colors.black),
                                            ),),
                                          SizedBox(width: 100.0,),
                                          Text('Time Remaining: ', //timer
                                            style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.4, color: Colors.black),
                                            ),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30.0,),
                                SizedBox(
                                  width: 950.0,
                                  height: 500.0,
                                  child: Container(
                                    child: Card(
                                      shadowColor: Colors.grey,
                                      surfaceTintColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 50.0,),
                            Column(
                              children: [
                                SizedBox(
                                  height: 250.0,
                                  width: 400.0,
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
                                              textStyle: TextStyle(fontSize: 20,
                                                letterSpacing: 0.3,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0,),
                                SizedBox(
                                  height: 250.0,
                                  width: 400.0,
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
                                            '   Question  Navigation',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(fontSize: 20,
                                                letterSpacing: 0.3,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,),
                                            ),
                                          ),
                                          SizedBox(height: 20.0,),
                                          Row(
                                            children: [
                                              //Do it Dynamically
                                              TextButton(
                                                onPressed: () {},
                                                child: Text('1',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(fontSize: 14,
                                                    letterSpacing: 0.3,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,),),),
                                                style: ElevatedButton.styleFrom(
                                                  shape: CircleBorder(),
                                                  foregroundColor: Colors.redAccent,
                                                  backgroundColor: Colors.redAccent.withOpacity(0.3),
                                                  surfaceTintColor: Colors.white,
                                                  shadowColor: Colors.white,
                                                  padding: EdgeInsets.all(14),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text('2',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(fontSize: 14,
                                                      letterSpacing: 0.3,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600,),),),
                                                style: ElevatedButton.styleFrom(
                                                  shape: CircleBorder(),
                                                  foregroundColor: Colors.redAccent,
                                                  backgroundColor: Colors.redAccent.withOpacity(0.3),
                                                  surfaceTintColor: Colors.white,
                                                  shadowColor: Colors.white,
                                                  padding: EdgeInsets.all(14),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text('3',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(fontSize: 14,
                                                      letterSpacing: 0.3,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600,),),),
                                                style: ElevatedButton.styleFrom(
                                                  shape: CircleBorder(),
                                                  foregroundColor: Colors.redAccent,
                                                  backgroundColor: Colors.redAccent.withOpacity(0.3),
                                                  surfaceTintColor: Colors.white,
                                                  shadowColor: Colors.white,
                                                  padding: EdgeInsets.all(14),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text('4',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(fontSize: 14,
                                                      letterSpacing: 0.3,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600,),),),
                                                style: ElevatedButton.styleFrom(
                                                  shape: CircleBorder(),
                                                  foregroundColor: Colors.redAccent,
                                                  backgroundColor: Colors.redAccent.withOpacity(0.3),
                                                  surfaceTintColor: Colors.grey,
                                                  shadowColor: Colors.white,
                                                  padding: EdgeInsets.all(14),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text('5',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(fontSize: 14,
                                                      letterSpacing: 0.3,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600,),),),
                                                style: ElevatedButton.styleFrom(
                                                  shape: CircleBorder(),
                                                  foregroundColor: Colors.redAccent,
                                                  backgroundColor: Colors.redAccent.withOpacity(0.3),
                                                  surfaceTintColor: Colors.white,
                                                  shadowColor: Colors.white,
                                                  padding: EdgeInsets.all(14),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text('6',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(fontSize: 14,
                                                      letterSpacing: 0.3,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600,),),),
                                                style: ElevatedButton.styleFrom(
                                                  shape: CircleBorder(),
                                                  foregroundColor: Colors.redAccent,
                                                  backgroundColor: Colors.redAccent.withOpacity(0.3),
                                                  surfaceTintColor: Colors.white,
                                                  shadowColor: Colors.white,
                                                  padding: EdgeInsets.all(14),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text('7',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(fontSize: 14,
                                                      letterSpacing: 0.3,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600,),),),
                                                style: ElevatedButton.styleFrom(
                                                  shape: CircleBorder(),
                                                  foregroundColor: Colors.redAccent,
                                                  backgroundColor: Colors.redAccent.withOpacity(0.3),
                                                  surfaceTintColor: Colors.white,
                                                  shadowColor: Colors.white,
                                                  padding: EdgeInsets.all(14),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    TextButton(onPressed: () {},
                                        child: Row(
                                          children: [
                                            Icon(CupertinoIcons.arrowtriangle_left_fill, color: Colors.black, size: 12.0,),
                                            Text('    Prev',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(fontSize: 12,
                                                  letterSpacing: 0.3,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,),),
                                            ),
                                          ],
                                        ),
                                    ),
                                    SizedBox(width: 200.0,),
                                    TextButton(onPressed: () {},
                                      child: Row(
                                        children: [
                                          Icon(CupertinoIcons.arrowtriangle_right_fill, color: Colors.black, size: 12.0,),
                                          Text('    Next',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(fontSize: 12,
                                                letterSpacing: 0.3,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30.0,),
                                SizedBox(
                                  height:30.0,
                                  child: ElevatedButton( child: Text(
                                    ' Finish Exam  ',
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
                                    onPressed: () {
                                      _showPopup(context);
                                    },
                                  ),
                                ),

                              ],
                            ),
                          ],
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
void _showPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return PopupCard();
    },
  );
}

class PopupCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Finish Exam'),
      content: Text('Are you sure you want to finish your exam?'),
      actions: [
        SizedBox(
          height:30.0,
          child: Row(
            children: [
              ElevatedButton(
                child: Text(
                ' Finish Exam  ',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 12, letterSpacing: 0.5, color: Colors.white),
                ),
              ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  primary: Colors.redAccent,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const FinishExam()),
                  );
                },
              ),
              SizedBox(width: 30.0,),
              ElevatedButton(
                child: Text(
                  ' Cancel  ',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 12, letterSpacing: 0.5, color: Colors.white),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  primary: Colors.redAccent,
                ),
                onPressed: () {
                  Navigator.of(context).pop(
                    MaterialPageRoute(builder: (context) => const ExamScreen()),
                  );
                },
              ),

            ],
          ),
        ),
      ],
    );
  }
}
