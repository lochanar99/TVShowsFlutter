import 'package:flutter/material.dart';

class Reminder extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Reminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('reimnder screen')),
    );
  }
}