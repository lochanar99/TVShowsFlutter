import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvshow/db/reminder_database.dart';
import 'package:tvshow/model/reminders.dart';
import 'package:tvshow/pages/viewAllReminders.dart';

//void main() => runApp(CreateReminder());

class UpdateReminder extends StatelessWidget {


  String title,show,dropdownValue;
  int id;

  UpdateReminder(this.id,this.show,this.title,this.dropdownValue);

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Update Reminders';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 214, 64, 69),
          accentColor: Color.fromARGB(255, 18, 53, 91),
          backgroundColor: Color.fromARGB(255,	71,	89,	126)
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(id,title,show,dropdownValue),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {

  String title, show, dropdownValue;
  int id;

  MyCustomForm(this.id, this.title,this.show, this.dropdownValue);

  @override
  MyCustomFormState createState() {

    return MyCustomFormState(id,title,show,dropdownValue);
  }
}
// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  ReminderDatabase helper = ReminderDatabase();


  TextEditingController _title = TextEditingController();
  TextEditingController _show = TextEditingController();

  String title, show,dropdownValue;
  int id;

  MyCustomFormState (this.id,this.title,this.show,this.dropdownValue);

  final _formKey = GlobalKey<FormState>();

  List<String> options = <String>['10 Minutes', '30 Minutes', '1 Hour'];
  //String dropdownValue = '10 Minutes';

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
                child: const Text('Update'),
                onPressed: () {

                  setState(() {
                    sendData(id,_title.text, _show.text, dropdownValue);
                    print(title);
                    print(show);
                    print(dropdownValue);

                    showAlertDialog(context);
                  });
                },
              )),
        ],
      ),
    );
  }

  void sendData(int id, String title, String show, String timer) async {
    var reminders = await helper.update(
        new Reminders(id: id ,channel: title, show: show, timer: timer));
    if(reminders > 0){
      print('xyyx');
    }

  }

  showAlertDialog(BuildContext context) {
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewAllReminders()));

      },
    );


    AlertDialog alert = AlertDialog(
      title: Text("Reminder Updated Successfully"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}