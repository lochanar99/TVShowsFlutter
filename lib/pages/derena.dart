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
            primaryColor: Color.fromARGB(255, 214, 64, 69),
            accentColor: Color.fromARGB(255, 18, 53, 91),
            backgroundColor: Color.fromARGB(255,	71,	89,	126)
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
  margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/derenatv.png'),
            ),
            title: Text('News',style: TextStyle(color: Colors.white60)),
            subtitle: Text('Derena News',style: TextStyle(color: Colors.white60)),
          tileColor: Theme.of(context).accentColor,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateReminder("Derena TV","Derena TV News"),
            ),
            );
          },

        ),
      ),

      Card(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/derenatv.png'),
          ),
          title: Text('Cartoons',style: TextStyle(color: Colors.white60)),
          subtitle: Text('Derena TV cartoons',style: TextStyle(color: Colors.white60)),
          tileColor: Theme.of(context).accentColor,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateReminder("Derena TV", "Derena TV Cartoons"),
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
          title: Text('Thor',style: TextStyle(color: Colors.white60)),
          subtitle: Text('Derena TV Movies',style: TextStyle(color: Colors.white60)),
          tileColor: Theme.of(context).accentColor,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateReminder("Derena TV", "Ragnarok"),
            ),
            );
          },
        ),
      )
    ],
  );
}