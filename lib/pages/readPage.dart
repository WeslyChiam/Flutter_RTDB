import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/theme/colors.dart';

class readPage extends StatefulWidget {
  @override
  State<readPage> createState() => _readPageState();
}

class _readPageState extends State<readPage> {
  String _displayName = '';
  String _displayEmail = '';
  String _displayText = '';
  DatabaseReference dref = FirebaseDatabase.instance.ref();

  late DatabaseReference databaseReference;
  final _database = FirebaseDatabase.instance.ref();

  final userNameRef = FirebaseDatabase.instance.ref();
  String _target = 'CM-1';

  @override
  void initState() {
    super.initState();
    _activateListenerse();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  Future<void> _activateListenerse() async {
    _database.child('User/User ID/CM-1/User Name').onValue.listen((event) {
      final Object? name = event.snapshot.value;
      setState(() {
        _displayName = 'Name: $name';
      });
    });
    _database.child('User/User ID/$_target/User Email').onValue.listen((event) {
      final Object? email = event.snapshot.value;
      setState(() {
        _displayEmail = 'Email: $email';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Read Data'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(_displayName),
              Text(_displayEmail),
              Text(_displayText),
              Container(
                decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      color: white,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
