import 'package:flutter/material.dart';

class Reminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListViews',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('TV shows')),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/hirutv.png'),
        ),
        title: Text('HiruTV'),

      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/derenatv.png'),
        ),
        title: Text('Derena TV'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/sirasatv.png'),
        ),
        title: Text('Sirasa TV'),
      ),
    ],
  );
}