import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/users.dart';
import 'package:flutterapp/pages/dashboard.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _nameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  bool _btnEnable = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      _btnEnable = _nameController.text.isNotEmpty &&
          _dateOfBirthController.text.isNotEmpty;
      setState(() {
        this._btnEnable = _btnEnable;
      });
    });

    _dateOfBirthController.addListener(() {
      _btnEnable = _nameController.text.isNotEmpty &&
          _dateOfBirthController.text.isNotEmpty;
      setState(() {
        this._btnEnable = _btnEnable;
      });
    });
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateOfBirthController.text =
            DateFormat('dd MMM, yyy').format(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: Text('Home Page'),
          backgroundColor: Colors.purple[900],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/world-icon.png',
                    height: 100,
                  ),
                ),
                Center(
                  child: Text(
                    "User Information",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30, top: 8),
                  child: TextFormField(
                    controller: _nameController,
                    style: TextStyle(color: Colors.purple[800], fontSize: 20.0),
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.person_add,
                        size: 20.0,
                        color: Colors.purple[800],
                      ),
                      border: UnderlineInputBorder(),
                      labelText: "Name",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30, top: 8),
                  child: TextFormField(
                    controller: _dateOfBirthController,
                    style: TextStyle(color: Colors.purple[800], fontSize: 20.0),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: Colors.purple[800],
                          icon: Icon(Icons.calendar_month),
                          onPressed: () {
                            selectDate(context);
                          },
                        ),
                        border: UnderlineInputBorder(),
                        labelText: 'Date_of_Birth'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ElevatedButton(
                      onPressed: _btnEnable
                          ? () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Dashboard(Users(
                                      _nameController.text,
                                      _dateOfBirthController.text))));
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple[900], // Background color
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 20 , color: Colors.grey),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
