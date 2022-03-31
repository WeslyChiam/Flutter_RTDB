import 'package:flutter/material.dart';
import 'package:gtk_flutter/const/add2RTDB.dart';
import 'package:gtk_flutter/theme/colors.dart';

final idTextController = TextEditingController();
final nameTextController = TextEditingController();
final latestPriceTextController = TextEditingController();
final oldPriceTextController = TextEditingController();
final descriptionTextController = TextEditingController();
final emailTextController = TextEditingController();
String productDropDownValue = 'AIR';
String roleDropDownValue = 'Co-worker';
DateTime now = DateTime.now();
String day = now.day.toString();
String month = now.month.toString();
String year = now.year.toString();
String hour = now.hour.toString();
String min = now.minute.toString();
String formattedDate = day + '/' + month + '/' + year;
String formattedTime = hour + ':' + min;

@override
void dispose() {
  idTextController.dispose();
}

Widget idTextField() {
  return TextField(
    controller: idTextController,
    decoration: const InputDecoration(
      prefixIcon: Icon(Icons.code),
      border: OutlineInputBorder(),
      labelText: 'ID Code',
    ),
  );
}

Widget nameTextField(name) {
  return TextField(
    controller: nameTextController,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.account_circle),
      border: const OutlineInputBorder(),
      labelText: '$name Name',
    ),
  );
}

Widget priceTextField() {
  return TextField(
    controller: latestPriceTextController,
    decoration: const InputDecoration(
      prefix: Icon(Icons.price_change),
      border: OutlineInputBorder(),
      labelText: 'Latest Price',
    ),
  );
}

Widget emailTextField() {
  return TextField(
    controller: emailTextController,
    decoration: const InputDecoration(
      prefix: Icon(Icons.email),
      border: OutlineInputBorder(),
      labelText: 'Email',
    ),
  );
}

Widget descTextField() {
  return TextField(
    controller: descriptionTextController,
    decoration: const InputDecoration(
      prefix: Icon(Icons.text_fields),
      border: OutlineInputBorder(),
      labelText: 'Description',
    ),
  );
}

Widget productCategoryDropD() {
  return DropdownButton<String>(
    value: productDropDownValue,
    icon: const Icon(Icons.arrow_drop_down),
    onChanged: (String? newValue) {
      productDropDownValue = newValue!;
    },
    items: <String>['AIR', 'ELEC', 'MECH']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}

Widget roleCategoryDropD() {
  return DropdownButton<String>(
    value: productDropDownValue,
    icon: const Icon(Icons.arrow_drop_down),
    onChanged: (String? newValue) {
      productDropDownValue = newValue!;
    },
    style: const TextStyle(color: black),
    items: <String>['Manager', 'Co-worker']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}

Widget addDataBtn(dataType) {
  return TextButton.icon(
    onPressed: () {
      if (dataType == 'Product') {
        productAdd2RTDB(
            idTextController.text,
            nameTextController.text,
            descriptionTextController.text,
            latestPriceTextController.text,
            productDropDownValue,
            formattedDate);
      } else if (dataType == 'User') {
        userAdd2RTDB(idTextController.text, nameTextController.text,
            emailTextController.text, roleDropDownValue);
      }
    },
    icon: const Icon(Icons.save),
    label: const Text(
      'Save',
      style: TextStyle(color: white),
    ),
  );
}
