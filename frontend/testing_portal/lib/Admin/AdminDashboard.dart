import 'package:testing_portal/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override

  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
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
                                        onPressed: () {},
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
                                    onPressed: () {},
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
                                    onPressed: () {},
                                    style:
                                    ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                        backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10.0,),
                                        Icon(CupertinoIcons.globe,color: Colors.black,size: 20.0,),
                                        SizedBox(height: 40.0,width: 8.0,),
                                         Text('Sector Skill Councils',
                                            style: GoogleFonts.hindSiliguri(
                                              textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
                          
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
                                    onPressed: () {},
                                 style:
                                 ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                   backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10.0,),
                                        Icon(CupertinoIcons.gauge,color: Colors.black,size: 20.0,),
                                        SizedBox(height: 40.0,width: 8.0,),
                                        Text('QPs & NOs      '
                                            '          ',
                                            style: GoogleFonts.hindSiliguri(
                                              textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
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
                                    onPressed: () {},
                                  style:
                                  ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                      backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10.0,),
                                        Icon(CupertinoIcons.group_solid,color: Colors.black,size: 20.0,),
                                        SizedBox(height: 40.0,width: 8.0,),
                                        Text('Assessors        '
                                            '           ',
                                            style: GoogleFonts.hindSiliguri(
                                              textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
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
                                    onPressed: () {},
                                  style:
                                  ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                      backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10.0,),
                                        Icon(CupertinoIcons.rectangle_on_rectangle_angled,color: Colors.black,size: 20.0,),
                                        SizedBox(height: 40.0,width: 8.0,),
                                        Text('Batches          '
                                            '      ',
                                            style: GoogleFonts.hindSiliguri(
                                              textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
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
                                    onPressed: () {},
                                  style:
                                  ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                      backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10.0,),
                                        Icon(CupertinoIcons.doc_text,color: Colors.black,size: 20.0,),
                                        SizedBox(height: 40.0,width: 8.0,),
                                       Text('Assessments          ',
                                            style: GoogleFonts.hindSiliguri(
                                              textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ),
                              SizedBox(height: 3.0,),
                              TextButton(
                                  onPressed: () {},
                                  style:
                                  ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                      backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10.0,),
                                      Icon(CupertinoIcons.person_crop_rectangle,color: Colors.black,size: 20.0,),
                                      SizedBox(height: 40.0,width: 8.0,),
                                      Text('Training Centres     '
                                        '          ',
                                          style: GoogleFonts.hindSiliguri(
                                            textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
                          
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                          
                              SizedBox(height: 3.0,),
                              TextButton(
                                  onPressed: () {},
                                  style:
                                  ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                      backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10.0,),
                                      Icon(CupertinoIcons.check_mark_circled,color: Colors.black,size: 20.0,),
                                      SizedBox(height: 40.0,width: 8.0,),
                                       Text('Results              ',
                                          style: GoogleFonts.hindSiliguri(
                                            textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
                          
                                          ),
                          
                                        ),
                          
                                    ],
                                  ),
                                ),
                          
                              SizedBox(height: 3.0,),
                               TextButton(
                                  onPressed: () {},
                                  style:
                                  ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                      backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10.0,),
                                      Icon(CupertinoIcons.command,color: Colors.black,size: 20.0,),
                                      SizedBox(height: 40.0,width: 8.0,),
                                       Text('Questions            ',
                                          style: GoogleFonts.hindSiliguri(
                                            textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
                          
                                          ),
                          
                                        ),
                          
                                    ],
                                  ),
                                ),
                          
                              SizedBox(height: 3.0,),
                              TextButton(
                                  onPressed: () {},
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                    backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10.0,),
                                      Icon(CupertinoIcons.doc_plaintext,color: Colors.black,size: 20.0,),
                                      SizedBox(height: 40.0,width: 8.0,),
                                      Text('Question Papers      ',
                                          style: GoogleFonts.hindSiliguri(
                                            textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
                          
                                          ),
                          
                                        ),
                          
                                    ],
                                  ),
                                ),
                          
                              SizedBox(height: 3.0,),
                              TextButton(
                                  onPressed: () {},
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                    backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10.0,),
                                      Icon(CupertinoIcons.chart_bar_square,color: Colors.black,size: 20.0,),
                                      SizedBox(height: 40.0,width: 8.0,),
                                       Text('Analysis             ',
                                          style: GoogleFonts.hindSiliguri(
                                            textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
                          
                                          ),
                          
                                        ),
                          
                                    ],
                                  ),
                                ),
                          
                              SizedBox(height: 3.0,),
                              TextButton(
                                  onPressed: () {},
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                    backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10.0,),
                                      Icon(CupertinoIcons.square_list,color: Colors.black,size: 20.0,),
                                      SizedBox(height: 40.0,width: 8.0,),
                                      Text('Reports              ',
                                          style: GoogleFonts.hindSiliguri(
                                            textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
                          
                                          ),
                          
                                        ),
                          
                                    ],
                                  ),
                                ),
                              SizedBox(height: 3.0,),
                              TextButton(
                                  onPressed: () {},
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                    backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10.0,),
                                      Icon(CupertinoIcons.layers,color: Colors.black,size: 20.0,),
                                      SizedBox(height: 40.0,width: 8.0,),
                                      Text('Masters              ',
                                          style: GoogleFonts.hindSiliguri(
                                            textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
                          
                                          ),
                          
                                        ),
                          
                                    ],
                                  ),
                                ),
                          
                              SizedBox(height: 3.0,),
                              TextButton(
                          
                                onPressed: () {},
                                style:
                                ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                    backgroundColor:MaterialStateProperty.all(Colors.white70.withOpacity(0.2))),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10.0,),
                                    Icon(CupertinoIcons.gear,color: Colors.black,size: 20.0,),
                                    SizedBox(height: 40.0,width: 8.0,),
                                    Text('Settings              ',
                                      style: GoogleFonts.hindSiliguri(
                                        textStyle: TextStyle(fontSize: 14, letterSpacing: 1.5, color: Colors.black, fontWeight: FontWeight.w600,),
                          
                                      ),
                          
                                    ),
                          
                                  ],
                                ),
                              ),
                          
                          
                              SizedBox(height: 10.0,),
                          
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
                                  'Welcome ADMIN,',
                              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: Colors.black),
                              )),
                              SizedBox(width: 280.0,),
                              SizedBox(
                                width: 520.0,
                                height: 50.0,
                                child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SearchAnchor(
                                        builder: (BuildContext context, SearchController controller) {
                                        return SearchBar(
                                        controller: controller,
                                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                        shadowColor: MaterialStatePropertyAll(Colors.white),
                                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                                        onTap: () {
                                        controller.openView();
                                        },
                                        onChanged: (_) {
                                        controller.openView();
                                        },
                                          leading: const Icon(Icons.search),
                                          hintText: 'Search',
                                        );
                                        }, suggestionsBuilder: (BuildContext context, SearchController controller)
                                        {return List<ListTile>.generate(1, (int index) {
                                          final String item = 'course ';
                                          return ListTile(
                                            title: Text(item),
                                            onTap: () {
                          setState(() {
                            controller.closeView(item);
                          });
                                            },
                                          );
                                        });},
                          
                                        ),
                          
                          
                          
                                )
                          
                                ),
                              SizedBox(width: 25.0,),
                              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell, color: Colors.black, size: 30.0,),),
                              SizedBox(width: 25.0,),
                              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.gear_big, color: Colors.black, size: 30.0,),),
                              SizedBox(width: 25.0,),
                              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.person_circle, color: Colors.redAccent, size: 30.0,),)
                                ],
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        Text('Portal Statistics',
                            style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 21, fontWeight: FontWeight.w600, letterSpacing: 0.2, color: Colors.black),
                            ),),
                        SizedBox(height: 10.0,),
                        IntrinsicWidth(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 284.0,
                                height: 100.0,
                                child: Card(
                                  shadowColor: Colors.grey,
                                  surfaceTintColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5.0,),
                                      Text('  ACTIVE ASSESSORS',
                                    style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.32, color: Colors.redAccent),
                                    ),
                                      ),
                                      SizedBox(height: 20.0,),
                                       Row(
                                         children: [
                                           //**
                                           //** Number input** //
                                           //**
                                           SizedBox(width: 220.0,),
                                           Icon(CupertinoIcons.graph_circle, color: Colors.green),
                                         ],
                                       ),
                          
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 30.0,),
                              SizedBox(
                                width: 284.0,
                                height: 100.0,
                                child: Card(
                                  shadowColor: Colors.grey,
                                  surfaceTintColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5.0,),
                                      Text('  TOTAL BATCHES',
                                        style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.3, color: Colors.redAccent),
                                        ),
                                      ),
                                      SizedBox(height: 20.0,),
                                      Row(
                                        children: [
                                          //**
                                          //** Number input** //
                                          //**
                                          SizedBox(width: 220.0,),
                                          Icon(CupertinoIcons.graph_circle, color: Colors.red),
                                        ],
                                      ),
                          
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 30.0,),
                              SizedBox(
                                width: 284.0,
                                height: 100.0,
                                child: Card(
                                  shadowColor: Colors.grey,
                                  surfaceTintColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5.0,),
                                      Text('  TOTAL SSC',
                                        style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.3, color: Colors.redAccent),
                                        ),
                                      ),
                                      SizedBox(height: 20.0,),
                                      Row(
                                        children: [
                                          //**
                                          //** Number input** //
                                          //**
                                          SizedBox(width: 220.0,),
                                          Icon(CupertinoIcons.graph_circle, color: Colors.green),
                          
                                        ],
                                      ),
                          
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 30.0,),
                              SizedBox(
                                width: 284.0,
                                height: 100.0,
                                child: Card(
                                  shadowColor: Colors.grey,
                                  surfaceTintColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5.0,),
                                      Text('  TOTAL STUDENTS',
                                        style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.3, color: Colors.redAccent),
                                        ),
                                      ),
                                      SizedBox(height: 20.0,),
                                      Row(
                                        children: [
                                          //**
                                          //** Number input** //
                                          //**
                                          SizedBox(width: 220.0,),
                                          Icon(CupertinoIcons.graph_circle, color: Colors.red),
                                        ],
                                      ),
                          
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        Row(
                          children: [
                            SizedBox(
                              width: 600.0,
                              height: 400.0,
                              child: Card(
                                shadowColor: Colors.grey,
                                surfaceTintColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  SizedBox(height: 5.0,),
                                  Center(
                                    child: Text(' Monthly Assessments Count',
                                      style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 0.4, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  ],
                              ),
                              ),
                            ),
                            SizedBox(width: 30.0,),
                            SizedBox(
                              width: 600.0,
                              height: 400.0,
                              child: Card(
                                shadowColor: Colors.grey,
                                surfaceTintColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5.0,),
                                    Center(
                                      child: Text('Daily Assessments Count',
                                        style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 0.4, color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15.0,),
                        SizedBox(
                          width: 600.0,
                          height: 100.0,
                          child: Card(
                            shadowColor: Colors.grey,
                            surfaceTintColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.0,),
                                Center(
                                  child: Text('Upcoming Assessments',
                                    style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 0.4, color: Colors.black),
                                    ),
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
