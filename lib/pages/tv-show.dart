import 'package:flutter/material.dart';
import 'package:tvshow/pages/viewAllReminders.dart';
import 'sirasa.dart';
import 'derena.dart';
import 'hiru.dart';

class Tvshow extends StatelessWidget {
  @override
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
        appBar: AppBar(title: Text('TV shows'), backgroundColor: Theme.of(context).primaryColor,),
        body: BodyLayout(
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(Icons.timer),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewAllReminders(),
            ));
          },
        ),
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
    padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
    children: <Widget>[
      Card(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/hirutv.png'),
          ),
          title: Text('HiruTV', style: TextStyle(color: Colors.white)),
          subtitle: Text('Entertainment, Drama, News, Cartoons', style: TextStyle(color: Colors.white60)),
          tileColor: Theme.of(context).accentColor,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: (){
            //AlertDialog(title: Text('TV Show Clicked') );

            Navigator.push(context, MaterialPageRoute(builder: (context)=> Hiru("x","y"),
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
          title: Text('Derena TV', style: TextStyle(color: Colors.white)),
          subtitle: Text('Entertainment, Drama, News, Cartoons', style: TextStyle(color: Colors.white60)),
          tileColor: Theme.of(context).accentColor,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Derena("x","y"),
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
            backgroundImage: AssetImage('assets/images/sirasatv.png'),
          ),
          title: Text('Sirasa TV', style: TextStyle(color: Colors.white)),
          subtitle: Text('Entertainment, Drama, News, Cartoons', style: TextStyle(color: Colors.white60)),
          tileColor: Theme.of(context).accentColor,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Sirasa("x","y"),
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
            backgroundImage: AssetImage('assets/images/hbo.png'),
          ),
          title: Text('HBO', style: TextStyle(color: Colors.white)),
          subtitle: Text('Entertainment, Drama and Movies', style: TextStyle(color: Colors.white60)),
          tileColor: Theme.of(context).accentColor,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Hiru("x","y"),
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
            backgroundImage: AssetImage('assets/images/tensports.png'),
          ),
          title: Text('Ten Sports', style: TextStyle(color: Colors.white)),
          subtitle: Text('Sports', style: TextStyle(color: Colors.white60)),
          tileColor: Theme.of(context).accentColor,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Derena("x","y"),
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
            backgroundImage: AssetImage('assets/images/bbc.png'),
          ),
          title: Text('BBC', style: TextStyle(color: Colors.white)),
          subtitle: Text('News 24x7', style: TextStyle(color: Colors.white60)),
          tileColor: Theme.of(context).accentColor,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Sirasa("x","y"),
            ),
            );
          },
        ),
        )
    ],
  );
}