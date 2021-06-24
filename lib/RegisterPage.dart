import 'package:firebasebackend/HomePage.dart';
import 'package:firebasebackend/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';



class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;

  late String email, password;

  get snapshot => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Register"),
          backgroundColor: Colors.orange,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.home),
                onPressed: () {
                  Navigator.pop(context);
                }
            ),
          ]
      ),
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showProgress,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "REGISTRATION PAGE",
                style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                        // ignore: unnecessary_statements
                        (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    };
                    InputDecoration(
                        hintText: "Enter your Email",
                        labelText: 'Email: ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(32.0))));
                  }),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                      // ignore: unnecessary_statements
                      (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  };
                  //get the value entered by user.
                },
                decoration: InputDecoration(
                    hintText: "Enter your Password",
                    labelText: 'Password: ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),

              ),
              SizedBox(
                height: 20.0,
              ),
              Material(
                elevation: 5,
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(32.0),
                child: MaterialButton(
                  onPressed: () async {
                    setState(() {
                      showProgress = true;
                    });
                    try {
                      final newuser =
                      await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()),
                      );

                      setState(() {
                        showProgress = false;
                      });
                    } catch (e) {}
                  },
                  minWidth: 200.0,
                  height: 45.0,
                  child: Text(
                    "Register",
                    style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
             GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage(snapshot: snapshot)),
              );

              child:
              Text(
                "Already Registered? Login Now",
                style: TextStyle(
                    color: Colors.deepPurple, fontWeight: FontWeight.w900),
              );
            }
            )
            ],
          ),
        ),
      ),
    );
  }
}
