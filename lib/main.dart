import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasebackend/HomePage.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAuth.instance;
  runApp(new MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: HomePage(),
    ),
  )
  );
}