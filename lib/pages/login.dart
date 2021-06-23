import 'package:flutter/material.dart';
import 'package:tvshow/model/user.dart';
import 'package:tvshow/pages/register.dart';
import 'package:tvshow/pages/tv-show.dart';
import 'package:tvshow/db/reminder_database.dart';

class Login extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ReminderDatabase helper = ReminderDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Container(
                constraints: BoxConstraints.expand(),
                padding: EdgeInsets.fromLTRB(50, 100, 50, 150),
                decoration: BoxDecoration(),
                child: Container(
                    width: 350,
                    height: 450,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).backgroundColor),
                    child: Form(
                        key: _formKey,
                        child: ListView(
                          padding: EdgeInsets.all(0),
                          children: <Widget>[
                            Icon(
                              Icons.tv_rounded,
                              color: Theme.of(context).primaryColor,
                              size: 30.0,
                            ),
                            Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).accentColor),
                                )),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Please enter username.';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      labelText: 'Enter Username',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextFormField(
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Please enter password';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                  obscureText: true,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      labelText: 'Enter Password',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                            ),
                            Container(
                                height: 40,
                                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: ElevatedButton(
                                  child: Text("Login".toUpperCase(),
                                      style: TextStyle(fontSize: 14)),
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Theme.of(context).primaryColor),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ))),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      login();
                                    }
                                  },
                                )),
                            Container(
                                child: Row(
                              children: <Widget>[
                                Text(
                                  "Don't have account?",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                TextButton(
                                  child: Text("Sign Up".toUpperCase(),
                                      style: TextStyle(fontSize: 12)),
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Register()));
                                  },
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ))
                          ],
                        ))))));
  }
}

void sendData(String username, String password) {
  var user = helper.create(new Users(email: email, show: show, timer: timer));
}
