import 'dart:core';
import 'package:testing_portal/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_portal/Admin/AdminDashboard.dart';
import 'package:testing_portal/Admin/AdminCalendar.dart';
import 'package:testing_portal/Admin/AdminAnalysis.dart';
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
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminSectorSkillCouncils extends StatefulWidget {
  const AdminSectorSkillCouncils({Key? key}) : super(key: key);

  @override
  State<AdminSectorSkillCouncils> createState() =>
      _AdminSectorSkillCouncilsState();
}

TextEditingController _sscnameController = TextEditingController();
TextEditingController _codeController = TextEditingController();

class _AdminSectorSkillCouncilsState extends State<AdminSectorSkillCouncils> {
  TextEditingController _sscnameController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  bool _isSaving = true;
  Future fetchData() async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/createSSC'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'sscname': _sscnameController.text,
          'code': _codeController.text,
        },
      ),
    );
  }

  Future<void> _login() async {
    setState(() {
      _isSaving = true;
    });
    final String apiUrl = 'http://localhost:8000/createSSC';

    final Map<String, String> data = {
      'sscname': _sscnameController.text,
      'code': _codeController.text,
    };

    setState(() {
      _isSaving = false;
    });
  }
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
                                SizedBox(
                                  width: 8.0,
                                ),
                                Image(
                                  image: AssetImage('images/Logo.png'),
                                  width: 50.0,
                                  height: 50.0,
                                  color: Colors.greenAccent,
                                ),
                                Text(
                                  'Portal',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                      letterSpacing: 1.5,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
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
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white70.withOpacity(0.2))),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Icon(
                                      CupertinoIcons.speedometer,
                                      color: Colors.black,
                                      size: 20.0,
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                      width: 8.0,
                                    ),
                                    Text(
                                      'Dashboard'
                                      '            ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
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
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white70.withOpacity(0.2))),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Icon(
                                      CupertinoIcons.calendar,
                                      color: Colors.black,
                                      size: 20.0,
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                      width: 8.0,
                                    ),
                                    Text(
                                      'Calendar          '
                                      '              ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
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
                                        builder: (context) =>
                                            AdminSectorSkillCouncils()),
                                  );
                                },
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    backgroundColor: hover == true
                                        ? MaterialStateProperty.all(
                                            Colors.white70.withOpacity(0.2))
                                        : MaterialStateProperty.all(
                                            Colors.redAccent.withOpacity(0.4))),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Icon(
                                      CupertinoIcons.globe,
                                      color: Colors.black,
                                      size: 20.0,
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                      width: 8.0,
                                    ),
                                    Text(
                                      'Sector Skill Councils',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
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
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white70.withOpacity(0.2))),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Icon(
                                      CupertinoIcons.gauge,
                                      color: Colors.black,
                                      size: 20.0,
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                      width: 8.0,
                                    ),
                                    Text(
                                      'QPs & NOs      '
                                      '          ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
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
                                        builder: (context) => AdminAssessors()),
                                  );
                                },
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white70.withOpacity(0.2))),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Icon(
                                      CupertinoIcons.group_solid,
                                      color: Colors.black,
                                      size: 20.0,
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                      width: 8.0,
                                    ),
                                    Text(
                                      'Assessors        '
                                      '           ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
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
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white70.withOpacity(0.2))),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Icon(
                                      CupertinoIcons
                                          .rectangle_on_rectangle_angled,
                                      color: Colors.black,
                                      size: 20.0,
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                      width: 8.0,
                                    ),
                                    Text(
                                      'Batches          '
                                      '      ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
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
                                        builder: (context) =>
                                            AdminAssessments()),
                                  );
                                },
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white70.withOpacity(0.2))),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Icon(
                                      CupertinoIcons.doc_text,
                                      color: Colors.black,
                                      size: 20.0,
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                      width: 8.0,
                                    ),
                                    Text(
                                      'Assessments          ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AdminTrainingCenters()),
                                );
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    CupertinoIcons.person_crop_rectangle,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Training Centres     '
                                    '          ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminResults()),
                                );
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    CupertinoIcons.check_mark_circled,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Results              ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminQuestions()),
                                );
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    CupertinoIcons.command,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Questions            ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AdminQuestionPapers()),
                                );
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    CupertinoIcons.doc_plaintext,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Question Papers      ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminAnalysis()),
                                );
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    CupertinoIcons.chart_bar_square,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Analysis             ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminReports()),
                                );
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    CupertinoIcons.square_list,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Reports              ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminMasters()),
                                );
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    CupertinoIcons.layers,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Masters              ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white70.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    CupertinoIcons.gear,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Settings              ',
                                    style: GoogleFonts.hindSiliguri(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 1.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            SizedBox(
                              height: 40.0,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 30.0,
                                  ),
                                  ElevatedButton(
                                    child: Text(
                                      'Logout ',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 12,
                                            letterSpacing: 0.5,
                                            color: Colors.white),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome ADMIN,',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                    color: Colors.black),
                              )),
                          SizedBox(
                            width: 280.0,
                          ),
                          SizedBox(
                              width: 520.0,
                              height: 50.0,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SearchAnchor(
                                  builder: (BuildContext context,
                                      SearchController controller) {
                                    return SearchBar(
                                      controller: controller,
                                      shape: MaterialStatePropertyAll<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero)),
                                      shadowColor: MaterialStatePropertyAll(
                                          Colors.white),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.white),
                                      onTap: () {
                                        controller.openView();
                                      },
                                      onChanged: (_) {
                                        controller.openView();
                                      },
                                      leading: const Icon(Icons.search),
                                      hintText: 'Search',
                                    );
                                  },
                                  suggestionsBuilder: (BuildContext context,
                                      SearchController controller) {
                                    return List<ListTile>.generate(1,
                                        (int index) {
                                      final String item = 'course ';
                                      return ListTile(
                                        title: Text(item),
                                        onTap: () {
                                          setState(() {
                                            controller.closeView(item);
                                          });
                                        },
                                      );
                                    });
                                  },
                                ),
                              )),
                          SizedBox(
                            width: 25.0,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.bell,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.gear_big,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.person_circle,
                              color: Colors.redAccent,
                              size: 30.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Sector Skill Councils',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: 670.0,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white60),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Export',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.2,
                                      color: Colors.redAccent),
                                ),
                              ),
                              SizedBox(
                                width: 40.0,
                              ),
                              Icon(
                                CupertinoIcons.chevron_up_chevron_down,
                                color: Colors.redAccent,
                                size: 18.0,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _showPopup(context);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.redAccent),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add New SSC',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.2,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                CupertinoIcons.plus_circle,
                                color: Colors.white,
                                size: 18.0,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Total Councils: ', //add number API
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2,
                            color: Colors.black),
                      ),
                    ),
                    Card(
                      shadowColor: Colors.white60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(),
                    ),
                  ],
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
      title: Text(
        'Add New SSC',
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 14,
            letterSpacing: 1.0,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      content: SizedBox(
        height: 1.0,
      ),
      actions: [
        SizedBox(
          width: 250.0,
          height: 165.0,
          child: Column(
            children: [
              Row(
                children: [
                      Row(
                        children: [
                          Text('SSC Name: ',
                            style: GoogleFonts.poppins( textStyle: TextStyle(fontSize: 12,letterSpacing: 1.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,),
                            ),),
                          SizedBox(width: 10.0,),
                          Expanded(
                            child: TextField(
                              controller: _sscnameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                hintText: 'Add SSC Name',
                                filled: true,
                                fillColor: Colors.redAccent.withOpacity(0.1),
                                hoverColor: Colors.grey.shade100,
                              ),
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  letterSpacing: 1.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        children: [
                          Text(
                        'SSC Code: ',
                        style: GoogleFonts.poppins( textStyle: TextStyle(fontSize: 12,letterSpacing: 1.0,
                       color: Colors.black,
                       fontWeight: FontWeight.w600,),
    ),),
                          SizedBox(width: 12.0,),
                          Expanded(
                            child:
                            TextField(
                            controller: _codeController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              hintText: 'Add SSC Code',
                              filled: true,
                              fillColor: Colors.redAccent.withOpacity(0.1),
                              hoverColor: Colors.grey.shade100,
                            ),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 12,
                                letterSpacing: 1.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          ),
                        ],
                      ),
                  Text(
                    'SSC Name: ',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 12,
                        letterSpacing: 1.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _sscnameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'Add SSC Name',
                        filled: true,
                        fillColor: Colors.redAccent.withOpacity(0.1),
                        hoverColor: Colors.grey.shade100,
                      ),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          primary: Colors.redAccent,
                        ),
                        onPressed: ()
                        async {
                          // Call fetchData and wait for it to complete
                          // await fetchData();
                          final response = await http.post(
                            Uri.parse('http://localhost:8000/createSSC'),
                            headers: <String, String>{
                              'Content-Type':
                              'application/json; charset=UTF-8',
                            },
                          );
                          print(response.body);
                          print(response.statusCode);
                          if (response.statusCode == 200) {
                            // Navigate to the next screen (replace with your navigation logic)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                    const AdminSectorSkillCouncils()),
                            );
                          } else {
                            // Show error message to the user (replace with your UI logic)
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('SSC Upload Failed'),
                                  content: Text(
                                      ''),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text(
                    'SSC Code: ',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 12,
                        letterSpacing: 1.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _codeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'Add SSC Code',
                        filled: true,
                        fillColor: Colors.redAccent.withOpacity(0.1),
                        hoverColor: Colors.grey.shade100,
                      ),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  ElevatedButton(
                    child: Text(
                      ' Save ',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 12,
                            letterSpacing: 0.5,
                            color: Colors.white),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      primary: Colors.redAccent,
                    ),
                    onPressed: () async {
                      //post request to add new SSC
                      final response = await http.post(
                        Uri.parse('http://localhost:8000/createSSC'),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonEncode(
                          <String, String>{
                            'adminId': 'ZVbVLz0Jwqhmt13yivVHWhILdbN2',
                            'Skill_council_name': _sscnameController.text,
                            'SSC_code': _codeController.text,
                          },
                        ),
                      );
                      print(_sscnameController.text);
                      print(_codeController.text);
                      print('SSC created');
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                            builder: (context) =>
                                const AdminSectorSkillCouncils()),
                      );
                      print(response.body);
                    },
                  ),
                  SizedBox(
                    width: 58.0,
                  ),
                  ElevatedButton(
                    child: Text(
                      ' Cancel  ',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 12,
                            letterSpacing: 0.5,
                            color: Colors.white),
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
                        MaterialPageRoute(
                            builder: (context) =>
                                const AdminSectorSkillCouncils()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
