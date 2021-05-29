import 'package:flutter/material.dart';

class CreateReminder extends StatefulWidget {
  @override
  _CreateReminderState createState() => _CreateReminderState();
}

class _CreateReminderState extends State<CreateReminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('reminder creation screen')),
    );
  }
}