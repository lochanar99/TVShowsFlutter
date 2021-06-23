import 'package:flutter/material.dart';
import 'package:tvshow/pages/create-reminder.dart';
import 'package:tvshow/pages/reminder.dart';

class Sirasa extends StatelessWidget {

  final String Channel;
  final String show;

  Sirasa(this.Channel, this.show);

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
              backgroundImage: AssetImage('assets/images/sirasatv.png'),
            ),
            title: Text('News'),
            subtitle: Text('Sirasa TV News'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateReminder("Sirasa","Sirasa TV News"),
            ),
            );
          },

        ),
      ),

      Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/sirasatv.png'),
          ),
          title: Text('Cartoons'),
          subtitle: Text('Sirasa TV cartoons'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateReminder("Cartoons", "Sirasa TV Cartoons"),
            ),
            );
          },
        ),
      ),

      Card(

        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/sirasatv.png'),
          ),
          title: Text('Sports'),
          subtitle: Text('Srilanka vs Bangaladesh'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateReminder("Sports","Sirasa TV Sports"),
            ),
            );
          },
        ),
      )
    ],
  );
}