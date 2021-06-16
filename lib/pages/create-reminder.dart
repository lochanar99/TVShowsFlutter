import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvshow/db/reminder_database.dart';
import 'package:tvshow/model/reminders.dart';
import 'package:tvshow/pages/reminder.dart';

//void main() => runApp(CreateReminder());

class CreateReminder extends StatelessWidget {


  String title, show;

  CreateReminder(this.show,this.title);

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Create Reminder';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(title,show),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {

  String title, show;

  MyCustomForm(this.title,this.show);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState(title,show);
  }
}
// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  ReminderDatabase helper = ReminderDatabase();


  TextEditingController _title = TextEditingController();
  TextEditingController _show = TextEditingController();

  String title, show;

  MyCustomFormState (this.title,this.show);

  final _formKey = GlobalKey<FormState>();

  List<String> options = <String>['10 Minutes', '30 Minutes', '1 Hour'];
  String dropdownValue = '10 Minutes';

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    _title.text = title;
    _show.text = show;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _title,
            decoration: const InputDecoration(
              icon: const Icon(Icons.campaign),
              labelText: 'Channel',
            ),
          ),
          TextFormField(
            controller: _show,
            decoration: const InputDecoration(
              icon: const Icon(Icons.tv_rounded),
              labelText: 'Show',
            ),
          ),
    Container(
      padding: const EdgeInsets.only(left: 150.0, top: 40.0) ,
    alignment: Alignment.topLeft,
    color: Colors.white,
    child: DropdownButton<String>(
    value: dropdownValue,
    onChanged: (String? newValue) {
    setState(() {
    dropdownValue = newValue!;
    });
    },
    style: const TextStyle(color: Colors.black),
    selectedItemBuilder: (BuildContext context) {
    return options.map((String value) {
    return Text(
    dropdownValue,
    style: const TextStyle(color: Colors.black),
    );
    }).toList();
    },
    items: options.map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList(),
    ),
    ),
          new Container(
          padding: const EdgeInsets.only(left: 150.0, top: 40.0),
    color: Colors.white,
    child: new ElevatedButton(
    child: const Text('Submit'),
    onPressed: null,
    )),
        ],
      ),
    );
  }

  void sendData(String title, String show, String timer){

   helper.create(new Reminders(title = "x", show, timer));


  }


}