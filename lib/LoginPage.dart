import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasebackend/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';



class LoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();

  DocumentSnapshot snapshot;

  // ignore: non_constant_identifier_names
  LoginPage({required this.snapshot});
}


class _MyLoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  late String email, password;

  var Fluttertoast;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Colors.purple,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
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
                "LOGIN PAGE",
                style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
              new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(10.0),
                    child: new Image.network(widget.snapshot["pic"],
                      height: 200.0,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  )
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
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
                  }
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                        (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    };
                    InputDecoration(
                        hintText: "Enter your Password",
                        labelText: 'Password: ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(32.0))));
                  }),
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
                      final newUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);

                      print(newUser.toString());

                      if (newUser != null) {
                        Fluttertoast.showToast(
                            msg: "Login Successfull",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.black45,
                            textColor: Colors.white,
                            fontSize: 20.0);
                        setState(() {
                          showProgress = false;
                        });
                      }
                    } catch (e) {}
                  },
                  minWidth: 200.0,
                  height: 45.0,
                  child: Text(
                    "Login",
                    style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                ),
              )],
          ),
        ),
      ),
    );
  }

}

class ToastGravity {
  static var CENTER;
}