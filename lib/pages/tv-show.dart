import 'package:flutter/material.dart';
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Hiru(),
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Derena(),
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Sirasa(),
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
            backgroundImage: AssetImage('assets/images/hirutv.png'),
          ),
          title: Text('HiruTV', style: TextStyle(color: Colors.white)),
          subtitle: Text('Entertainment, Drama, News, Cartoons', style: TextStyle(color: Colors.white60)),
          tileColor: Theme.of(context).accentColor,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Hiru(),
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Derena(),
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Sirasa(),
            ),
            );
          },
        ),
        )
    ],
  );
}