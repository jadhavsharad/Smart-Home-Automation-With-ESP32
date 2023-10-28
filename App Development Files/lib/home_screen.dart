import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_automation/logins_screen.dart';
import 'package:home_automation/pages/about_page.dart';
import 'package:home_automation/pages/bottom_sheet_led.dart';
import 'package:home_automation/pages/bottom_sheet_fan.dart';
import 'package:home_automation/widgets/button_widget_fan.dart';
import 'package:home_automation/widgets/button_widget_led.dart';
import 'package:home_automation/widgets/chart.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  HomeScreen({super.key});
  void _signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  DateTime _currentTime = DateTime.now();

  void _updateTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => widget._signOut(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 185, 180, 199),
                ),
                child: Text('Project Exibition'),
              ),
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
          ],
        ),
      ),

      //!  Body part...

      body: Column(
        children: [
          Stack(
            children: [
              Opacity(opacity: 0.7),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 240, 124, 163),
                      Color.fromARGB(147, 255, 165, 135)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                width: double.infinity,
                height: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 5, top: 55),
                                child: Text(
                                  DateFormat('hh:mm a').format(_currentTime),
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          color: Colors
                                              .black, // Choose the color of the shadow
                                          blurRadius:
                                              2.0, // Adjust the blur radius for the shadow effect
                                          offset: Offset(2.0,
                                              2.0), // Set the horizontal and vertical offset for the shadow
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20, top: 1),
                                child: Text(
                                  'Humidity : 30 %',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: const Icon(
                        Icons.cloud_sharp,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color:
                                Colors.black, // Choose the color of the shadow
                            blurRadius:
                                2.0, // Adjust the blur radius for the shadow effect
                            offset: Offset(2.0,
                                2.0), // Set the horizontal and vertical offset for the shadow
                          ),
                        ],
                        size: 100,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),

          //! home automation details :)

          const SizedBox(
            height: 300,
            child: Graph(),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const LedBottomScreen();
                    },
                  );
                },
                child: const LedButtonBox(),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const FanBottomScreen();
                    },
                  );
                },
                child: const FanButtonBox(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
