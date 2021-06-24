import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasebackend/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance;
  runApp(new MaterialApp(
    home: Scaffold(
      //appBar: AppBar(
      //  backgroundColor: Colors.orange,
      //),
      body: RegisterPage(),
    ),
  )
  );
}