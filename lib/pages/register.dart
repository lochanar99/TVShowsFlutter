import 'package:flutter/material.dart';
import 'package:tvshow/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:tvshow/db/reminder_database.dart';
import 'package:tvshow/pages/login.dart';
import 'dart:developer';


class Register extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Register> {
  TextEditingController emailController = TextEditingController();
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
                padding: EdgeInsets.fromLTRB(50, 90, 50, 70),
                decoration: BoxDecoration(),
                child: Container(
                    width: 350,
                    height: 550,
                    padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
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
                                  'Sign up',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).accentColor),
                                )),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                  controller: emailController,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Please enter email.';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      labelText: 'Enter Email',
                                      labelStyle: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                  controller: nameController,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Please enter name.';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      labelText: 'Enter Name',
                                      labelStyle: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      labelText: 'Enter Password',
                                      labelStyle: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                            ),
                            Container(
                                height: 40,
                                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: ElevatedButton(
                                  child: Text("Register".toUpperCase(),
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
                                      sendData();
                                    }
                                  },
                                )),
                            Container(
                                child: Row(
                              children: <Widget>[
                                Text(
                                  "Have an account already?",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                TextButton(
                                  child: Text("Sign In".toUpperCase(),
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
                                            builder: (context) => Login()));
                                  },
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ))
                          ],
                        ))))));
  }

  void sendData() {
    var user = helper.createUser(new Users(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text));

    if(user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Login()));
    }
  }
}
