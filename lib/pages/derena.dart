import 'package:flutter/material.dart';
import 'package:tvshow/pages/reminder.dart';

import 'create-reminder.dart';

class Derena extends StatelessWidget {
  @override

  final String channel;
  final String show;

  Derena(this.channel, this.show);

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
              backgroundImage: AssetImage('assets/images/derenatv.png'),
            ),
            title: Text('News'),
            subtitle: Text('Derena News'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateReminder("News","Derena TV News"),
            ),
            );
          },

        ),
      ),

      Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/derenatv.png'),
          ),
          title: Text('Cartoons'),
          subtitle: Text('Derena TV cartoons'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateReminder("Cartoons", "Derena TV Cartoons"),
            ),
            );
          },
        ),
      ),

      Card(

        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/derenatv.png'),
          ),
          title: Text('Movie1'),
          subtitle: Text('Derena TV Movies'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateReminder("Movies", "Derena TV Movies"),
            ),
            );
          },
        ),
      )
    ],
  );
}