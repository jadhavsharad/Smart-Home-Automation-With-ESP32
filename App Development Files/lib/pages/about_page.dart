import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Home Automation'),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.all(19),
              child: const Text(
                'Project Exihibiton Project developed by :\n\nSharad \nSiddharth \nNaman \nAkash \nSofiquee',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
