import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'package:testing_portal/Admin/AdminLoginScreen.dart';
import 'package:testing_portal/Assessor/AssessorLoginScreen.dart';
import 'package:testing_portal/SSC/SSCLoginScreen.dart';
import 'package:testing_portal/Student/StudentLoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.red,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.redAccent,
          hoverColor: Colors.redAccent,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.redAccent,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0, width: 80.0,),
                  Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Image(image: AssetImage('images/Logo.png')),
                    ],
                  ),
                  SizedBox(height: 30.0,width: 80.0,),
                  Row(
                    children: [
                      SizedBox(width: 20.0, height: 30.0,),
                      Text(
                        '"Empower Your Potential,',
                        style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontSize: 24, letterSpacing: 1.92, color: Colors.white),
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      SizedBox(width: 20.0,),
                      Text(
                        ' Click to Conquer!"',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 24, letterSpacing: 1.92, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 50.0,),
                  Stack(
                    children: [
                      Row(
                      children: [
                        SizedBox(width: 50.0,),
                        Transform.rotate(angle: 270,
                          child:  Image(image: AssetImage('images/image.png'),  width: 589,
                              height: 622, fit: BoxFit.contain,),
                        ),
                      ],
                    ),
          ],
                  )
                ],
              ),
             Expanded(
               child: Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.horizontal(left: Radius.circular(50.0), right: Radius.zero),
                   color: Colors.white,
                 ),
               
                 height: 810.0,
                 width: 956.8,
               
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(width: 40.0,),
                     SizedBox(height: 120.0,),
                     Text(
                       '              Choose a Login option',
                       style: GoogleFonts.poppins(
                         textStyle: TextStyle(fontSize: 24, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
                       ),
                     ),
                     SizedBox(width: 100.0,),
                     SizedBox(height: 30.0,),
                     Row(
                       children: [
                         SizedBox(width:300.0,),
                         Column(
                           children: [
                             Image(image: AssetImage('images/admin.png'),  width: 150,
                               height: 166, fit: BoxFit.contain,),
                             SizedBox(height: 7.0,),
                           SizedBox(
                             height:30.0,
                             child: ElevatedButton( child: Text(
                               ' Admin  ',
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
                                 MaterialPageRoute(builder: (context) => const AdminLoginScreen()),
                               );
                               },
                             ),
                           ),
                           ],
                         ),
                          SizedBox(width: 80.0,),
                         Column(
                           children: [
                             Image(image: AssetImage('images/student.png'),  width: 150,
                               height: 166, fit: BoxFit.contain,),
                             SizedBox(height: 7.0,),
                             SizedBox(
                               height:30.0,
                               child: ElevatedButton( child: Text(
                                 'Student ',
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
                                   MaterialPageRoute(builder: (context) => const StudentLoginScreen()),
                                 );
                                 },
                               ),
                             ),
                           ],
                         ),
                       ],
                     ),
                     SizedBox(height: 40.0,),
                     Row(
                       children: [
                         SizedBox(width:300.0,),
                         Column(
                           children: [

                             Image(image: AssetImage('images/assessor.png'),  width: 150,
                               height: 166, fit: BoxFit.contain,),
                             SizedBox(height: 7.0,),
                             SizedBox(
                               height:30.0,
                               child: ElevatedButton( child: Text(
                                 'Assessor',
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
                                   MaterialPageRoute(builder: (context) => const AssessorLoginScreen()),
                                 );
                                 },
                               ),
                             ),
                           ],
                         ),
                         SizedBox(width: 80.0,),
                         Column(
                           children: [
                             Image(image: AssetImage('images/ssc.png'),  width: 150,
                               height: 166, fit: BoxFit.contain,),
                             SizedBox(height: 7.0,),
                             SizedBox(
                               height:30.0,
                               child: ElevatedButton( child: Text(
                                 '    SSC    ',
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
                                   MaterialPageRoute(builder: (context) => const SSCLoginScreen()),
                                 );
                                 },
                               ),
                             ),
                           ],
                         ),
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
    );
  }
}


