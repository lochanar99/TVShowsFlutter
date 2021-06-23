// @dart=2.9
import 'package:flutter/material.dart';
import 'package:tvshow/pages/derena.dart';
import 'package:tvshow/pages/hiru.dart';
import 'package:tvshow/pages/login.dart';
import 'package:tvshow/pages/channel.dart';
import 'package:tvshow/pages/sirasa.dart';
import 'package:tvshow/pages/tv-show.dart';
import 'package:tvshow/pages/reminder.dart';
import 'package:tvshow/pages/create-reminder.dart';
import 'package:tvshow/pages/register.dart';
import 'package:splashscreen/splashscreen.dart';


void main() => runApp(MaterialApp(
    title: "Tv Show Reminder",
    home: new MyApp(),
    theme: ThemeData(
      // Define the default colors.
      primaryColor: Color.fromARGB(255, 214, 64, 69),
      accentColor: Color.fromARGB(255, 18, 53, 91),
      backgroundColor: Color.fromARGB(255,	71,	89,	126)
      ),
      routes: {
        '/login': (context) => Login(),
        '/channels': (context) => Channel(),
        '/shows': (context) => Tvshow(),
        '/reminders': (context) => Reminder(),
        '/create-reminder': (context) => CreateReminder(),
        '/hiru': (context) => Hiru(),
        '/derena': (context) => Derena(),
        '/sirasa': (context) => Sirasa(),
        '/register': (context) => Register()
      },
));


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: '/register',
      image: new Image.asset('assets/images/tv.png'),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Theme.of(context).primaryColor
    );
  }
}

