import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/const/text_field.dart';
import 'package:gtk_flutter/theme/colors.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: idTextField(),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: nameTextField('User'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: emailTextField(),
            ),
            Container(
              alignment: Alignment.center,
              color: blue,
              child: roleCategoryDropD(),
            ),
            // roleCategoryDropD(),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: addDataBtn('User'),
            ),
          ],
        ),
      ),
    );
  }
}
