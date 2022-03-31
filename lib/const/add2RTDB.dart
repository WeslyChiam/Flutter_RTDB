import 'package:firebase_database/firebase_database.dart';

void productAdd2RTDB(id, name, desc, price, category, date) {
  DatabaseReference _ref =
      FirebaseDatabase.instance.ref('Product/Product ID/$id');
  _ref.update({
    'Product Name': '$name',
    'Product Description': '$desc',
    'Price': '$price',
    'Category': '$category',
    'Last modify': '$date'
  }).asStream();
}

void userAdd2RTDB(id, name, email, role) {
  DatabaseReference _ref = FirebaseDatabase.instance.ref('User/User ID/$id');
  _ref.update({
    'User Name': '$name',
    'User Email': '$email',
    'User Role': '$role'
  }).asStream();
}
