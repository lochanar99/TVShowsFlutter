import 'package:flutter/material.dart';
import 'package:tvshow/pages/reminder.dart';

class Hiru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListViews',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('TV Programmes Available')),
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
      Card(
        child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/hirutv.png'),
            ),
            title: Text('News'),
            subtitle: Text('HiruTV News')

        ),
      ),

      Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/hirutv.png'),
          ),
          title: Text('Cartoons'),
          subtitle: Text('Hiru TV cartoons'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Reminder(),
            ),
            );
          },
        ),
      ),

      Card(

        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/hirutv.png'),
          ),
          title: Text('Movie1'),
          subtitle: Text('Hiru TV Movies'),
        ),
      )
    ],
  );
}