import 'package:flutter/material.dart';
import 'package:tvshow/pages/login.dart';
import 'package:tvshow/pages/channel.dart';
import 'package:tvshow/pages/tv-show.dart';
import 'package:tvshow/pages/reminder.dart';
import 'package:tvshow/pages/create-reminder.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/create-reminder',
      routes: {
        '/login': (context) => Login(),
        '/channels': (context) => Channel(),
        '/shows': (context) => TvShow(),
        '/reminders': (context) => Reminder(),
        '/create-reminder': (context) => CreateReminder()
      },
    ));
