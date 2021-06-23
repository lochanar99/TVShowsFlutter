
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tvshow/db/reminder_database.dart';
import 'package:tvshow/model/reminders.dart';
import 'package:tvshow/pages/create-reminder.dart';
import 'package:tvshow/pages/update-reminders.dart';

class ViewAllReminders extends StatefulWidget{

  State<StatefulWidget> createState(){
    return ViewAllRemindersState();
  }
}

class ViewAllRemindersState extends State<ViewAllReminders>{

  ReminderDatabase helper = ReminderDatabase();

  var reminderList;

  int count = 0;

  Widget build (BuildContext context){

    if(reminderList == null){
      reminderList = <Reminders>[];

      updateListView();
    }

    return Scaffold(
    appBar: AppBar(title: Text('Reminders'),),
    body: getReminderListView(context)
    );

  }

  ListView getReminderListView(BuildContext context){
    TextStyle? titleStyle = Theme.of(context).textTheme.subtitle1;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
        return Card(
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
            ),
            title: Text(this.reminderList[position].channel, style: titleStyle),
            subtitle: Text(this.reminderList[position].timer, style: titleStyle),
            trailing: GestureDetector(
              child:Icon(Icons.delete, color: Colors.red,),
              onTap: () {
                _delete(context, reminderList[position]);
              },
            ),
            onTap: (){
              debugPrint("ListTile Tapped");
              navigateToDetails(this.reminderList[position].id,this.reminderList[position].channel,this.reminderList[position].show,this.reminderList[position].timer);
            },

          ),
        );
      },
    );
  }

  void _delete(BuildContext context, Reminders reminder) async {

    int result = await helper.delete(reminder.id);
    if(result != 0){
      _showSnackBar(context);
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Deleted'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void navigateToDetails(int id, String title, String show, String dropdownValue) async{
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context){
      return UpdateReminder(id ,title, show, dropdownValue);
    }));
    if (result == true){
      updateListView();
    }
  }
  void updateListView(){
    final Future<Database> dbFuture = helper.initDB('reminder.db');
    dbFuture.then((database){

      Future<List<Reminders>> remindersListFuture = helper.readAll();
      remindersListFuture.then((reminderList){
        setState(() {
          this.reminderList = reminderList;
          this.count = reminderList.length;
        });
    });

    });
  }
}
