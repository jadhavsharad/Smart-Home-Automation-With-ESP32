import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SwitchControl2 extends StatefulWidget {
  final bool initialValue;
  final Function(bool) onChanged;

  SwitchControl2({required this.initialValue, required this.onChanged});

  @override
  _SwitchControl2State createState() => _SwitchControl2State();
}

class _SwitchControl2State extends State<SwitchControl2> {
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
            dbR.child('Pins/17/').set({'17': isSwitchOn});
          },
        );
      },
    );
  }
}
