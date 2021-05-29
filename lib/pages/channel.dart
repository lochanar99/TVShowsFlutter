import 'package:flutter/material.dart';

class Channel extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Channel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('channel screen')),
    );
  }
}
