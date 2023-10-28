import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FanButtonBox extends StatefulWidget {
  const FanButtonBox({super.key});

  @override
  State<FanButtonBox> createState() => _FanButtonBoxState();
}

class _FanButtonBoxState extends State<FanButtonBox> {
  final dbR = FirebaseDatabase.instance.ref();
  int switchValue1 = 1; // 0 represents 'OFF', and 1 represents 'ON'
  //!
  bool isBulbOn = false;

  void toggleBulb() {
    setState(() {
      isBulbOn = !isBulbOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 20),
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 240, 124, 163),
            Color.fromARGB(147, 255, 165, 135)
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isBulbOn ? Icons.wind_power : Icons.wind_power_outlined,
            size: 60.0,
            color: isBulbOn ? Colors.yellow : Colors.white,
          ),
          Switch(
            value: switchValue1 == 0, // Convert int to bool
            //!
            activeColor: Colors.black,
            activeTrackColor: Colors.white,
            onChanged: (bool newValue) {
              setState(() {
                dbR.child("Pins/17/").set({"17": switchValue1});
                switchValue1 = newValue ? 0 : 1; // Convert bool to int
                //!
              });
              toggleBulb();
            },
          ),
          Text(
            switchValue1 == 0 ? 'Fan ON' : 'Fan OFF',
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
