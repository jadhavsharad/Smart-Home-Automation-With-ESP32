import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SwitchControl extends StatefulWidget {
  final bool initialValue;
  final Function(bool) onChanged;

  SwitchControl({required this.initialValue, required this.onChanged});

  @override
  _SwitchControlState createState() => _SwitchControlState();
}

class _SwitchControlState extends State<SwitchControl> {
  final dbR = FirebaseDatabase.instance.ref();
  bool isSwitchOn = false;

  @override
  void initState() {
    super.initState();
    isSwitchOn = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitchOn,
      onChanged: (value) {
        setState(
          () {
            isSwitchOn = value;
            widget.onChanged(value); // Call the provided callback function
            dbR.child('Pins/').set({'16': isSwitchOn});
          },
        );
      },
    );
  }
}
