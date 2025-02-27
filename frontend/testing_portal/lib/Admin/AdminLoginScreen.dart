import 'package:flutter/material.dart';
import 'package:testing_portal/Admin/AdminDashboard.dart';
import 'package:testing_portal/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoggingIn = true;
  Future fetchData() async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/adminSignin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          // 'username': nameController.text,
          'username': nameController.text,
          'password': passwordController.text,
        },
      ),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> _login() async {
    setState(() {
      _isLoggingIn = true;
    });
    final String apiUrl = 'http://localhost:8000/adminSignin';

    final Map<String, String> data = {
      'username': nameController.text,
      'password': passwordController.text,
    };

    setState(() {
      _isLoggingIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.redAccent,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0,
                  width: 80.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.0,
                    ),
                    Image(image: AssetImage('images/Logo.png')),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                  width: 80.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20.0,
                      height: 30.0,
                    ),
                    Text(
                      '"Empower Your Potential,',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 24,
                            letterSpacing: 1.92,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      ' Click to Conquer!"',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 24,
                            letterSpacing: 1.92,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30.0,
                ),
                Stack(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 60.0,
                        ),
                        Image(
                          image: AssetImage('images/admin.png'),
                          width: 511,
                          height: 588,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(50.0), right: Radius.zero),
                color: Colors.white,
              ),
              height: 810.0,
              width: 965.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 120.0,
                  ),
                  Text(
                    '          Admin Login',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 24,
                        letterSpacing: 1.5,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 350.0,
                        height: 100.0,
                      ),
                      SizedBox(
                        width: 300.0,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            hintText: 'Login ID',
                            filled: true,
                            fillColor: Colors.redAccent.withOpacity(0.1),
                            hoverColor: Colors.grey.shade100,
                          ),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 14,
                              letterSpacing: 1.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 350.0,
                      ),
                      SizedBox(
                        width: 300.0,
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            hintText: 'Password',
                            filled: true,
                            fillColor: Colors.redAccent.withOpacity(0.1),
                            hoverColor: Colors.grey.shade100,
                          ),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 14,
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
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 350.0,
                      ),
                      SizedBox(
                        width: 300.0,
                        height: 40.0,
                        child: ElevatedButton(
                            child: Text(
                              'Login ',
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
                              // Call fetchData and wait for it to complete
                              // await fetchData();
                              final response = await http.post(
                                Uri.parse('http://localhost:8000/adminSignin'),
                                headers: <String, String>{
                                  'Content-Type':
                                      'application/json; charset=UTF-8',
                                },
                                body: jsonEncode(
                                  <String, String>{
                                    // 'username': nameController.text,
                                    'username': nameController.text,
                                    'password': passwordController.text,
                                  },
                                ),
                              );
                              print(response.body);
                              print(response.statusCode);
                              if (response.statusCode == 200) {
                                // Navigate to the next screen (replace with your navigation logic)
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AdminDashboard()),
                                );
                              } else {
                                // Show error message to the user (replace with your UI logic)
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Login Failed'),
                                      content: Text(
                                          'Incorrect username or password.'),
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
                            }),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 490.0,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 14,
                              letterSpacing: 1.0,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
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
