import 'package:flutter/material.dart';
import 'package:tvshow/pages/derena.dart';
import 'package:tvshow/pages/hiru.dart';
import 'package:tvshow/pages/login.dart';
import 'package:tvshow/pages/channel.dart';
import 'package:tvshow/pages/sirasa.dart';
import 'package:tvshow/pages/tv-show.dart';
import 'package:tvshow/pages/reminder.dart';
import 'package:tvshow/pages/create-reminder.dart';


void main() => runApp(MaterialApp(
    title: "Tv Show Reminder",
    theme: ThemeData(
      // Define the default colors.
      primaryColor: Color.fromARGB(255, 214, 64, 69),
      accentColor: Color.fromARGB(255, 18, 53, 91),
      backgroundColor: Color.fromARGB(255,	71,	89,	126)
      ),
      initialRoute: '/shows',
      routes: {
        '/login': (context) => Login(),
        '/channels': (context) => Channel(),
        '/shows': (context) => Tvshow(),
        '/reminders': (context) => Reminder(),
        '/create-reminder': (context) => CreateReminder(),
        '/hiru': (context) => Hiru(),
        '/derena': (context) => Derena(),
        '/sirasa': (context) => Sirasa()
      },
    ));


