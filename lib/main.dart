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
import 'package:animated_splash_screen/animated_splash_screen.dart';

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
        '/create-reminder': (context) => CreateReminder("a", "b"),
        '/hiru': (context) => Hiru("a", "b"),
        '/derena': (context) => Derena("a", "b"),
        '/sirasa': (context) => Sirasa("a", "b"),
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
    return AnimatedSplashScreen(
      nextScreen: Register(),
      duration: 5000,
      animationDuration: Duration(seconds: 2),
      splash: new Image.asset('assets/images/tv.png'),
      splashIconSize: 300
    );
  }
}

