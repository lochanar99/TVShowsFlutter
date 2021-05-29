import 'package:flutter/material.dart';

class TvShow extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TvShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('shows screen')),
    );
  }
}