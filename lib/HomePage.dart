import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasebackend/FifthPage.dart';
import 'package:firebasebackend/FirstPage.dart';
import 'package:firebasebackend/ForthPage.dart';
import 'package:firebasebackend/PostDetails.dart';
import 'package:firebasebackend/RegisterPage.dart';
import 'package:firebasebackend/SecondPage.dart';
import 'package:firebasebackend/ThirdPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';




class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<HomePage> {
  //top post
  // ignore: cancel_subscriptions
  late StreamSubscription<QuerySnapshot>subscription;
  late List<DocumentSnapshot>snapshot;

  CollectionReference collectionReference=FirebaseFirestore.instance.collection("TopPost");

  //for body post
  // ignore: cancel_subscriptions
  late StreamSubscription<QuerySnapshot>sdSubscription;
  late List<DocumentSnapshot>sdSnapshot;

  CollectionReference SdCollectionReference=FirebaseFirestore.instance.collection("BodyPost");


  @override
  void initState() {

    subscription=collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot=datasnapshot.docs;
      });
    });

    // ignore: non_constant_identifier_names
    sdSubscription=SdCollectionReference.snapshots().listen((SdDatasnap) {
      sdSnapshot=SdDatasnap.docs;
    });


    super.initState();
    initUser();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User UserFirebase;


  initUser() async {
    UserFirebase = Future as User; _auth.currentUser!;
    setState(() {});
  }


  passData(DocumentSnapshot snap){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>PostDetails(snapshot: snap,)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Firebase Backend App"),
          backgroundColor: Colors.orange,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.search),
                onPressed: ()=> debugPrint("Search")
            ),
            new IconButton(
                icon: new Icon(Icons.account_circle_rounded),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                }
            ),
          ],
        ),

        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text("${UserFirebase.email}"),
                decoration: new BoxDecoration(
                    color: Colors.purple
                ), accountName: null,
              ),
              new ListTile(
                title: new Text("First Page"),
                leading: new Icon(Icons.cake,color: Colors.redAccent,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstPage()),
                  );
                },
              ),
              new ListTile(
                title: new Text("Second Page"),
                leading: new Icon(Icons.linked_camera,color: Colors.green,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
              ),
              new ListTile(
                title: new Text("Third Page"),
                leading: new Icon(Icons.map,color: Colors.blueAccent,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );
                },
              ),
              new ListTile(
                title: new Text("Forth Page"),
                leading: new Icon(Icons.table_chart,color: Colors.amberAccent,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForthPage()),
                  );
                },
              ),
              new ListTile(
                  title: new Text("Fifth Page"),
                  leading: new Icon(Icons.pie_chart,color: Colors.pink,),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FifthPage()),
                    );
                  }
              ),
              new Divider(
                height: 10.0,
                color: Colors.black,
              ),
              new ListTile(
                title: new Text("Close"),
                trailing: new Icon(Icons.close,color: Colors.red,),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),


            ],
          ),
        ),


        body: new ListView(
            children: <Widget>[

              new Container(
                height: 200,
                child: new ListView.builder(
                  itemCount: snapshot.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 10.0,
                      margin: EdgeInsets.all(10.0),
                      child: new Container(
                        margin: EdgeInsets.all(10.0),
                        child: new Column(
                          children: <Widget>[

                            new ClipRRect(
                              borderRadius: new BorderRadius.circular(10.0),
                              child: new Image.network(snapshot[index]["url"],
                                height: 120.0,
                                width: 120.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            new SizedBox(height: 5.0,),
                            new Text(snapshot[index]["title"],
                                style: TextStyle(fontSize: 19.0, color: Colors.deepPurple))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              new Container(
                height: MediaQuery.of(context).size.height,
                child: new ListView.builder(
                    itemCount: sdSnapshot.length,
                    itemBuilder: (context, index) {

                      return Card(
                          elevation: 7.0,
                          margin: EdgeInsets.all(10.0),
                          child: new Container(
                              padding: EdgeInsets.all(10.0),
                              child: new Column(
                                  children: <Widget>[
                                    new Row(
                                      children: <Widget>[
                                        new CircleAvatar(
                                          child: new Text(sdSnapshot[index]["title"][0]),
                                          backgroundColor: Colors.purple,
                                          foregroundColor: Colors.white,
                                        ),
                                        new SizedBox(width: 10.0,),
                                        new InkWell(
                                          child: new Text(sdSnapshot[index]["title"],
                                            style: TextStyle(fontSize: 20.0, color: Colors.purpleAccent),

                                          ),
                                          onTap: (){
                                            passData(sdSnapshot [index]);
                                          },
                                        )
                                      ],
                                    ),
                                    new SizedBox(height: 10.0,),
                                    new Column(
                                      children: <Widget>[

                                        new ClipRRect(
                                          borderRadius: BorderRadius.circular(15.0),
                                          child: new Image.network(sdSnapshot[index]["url"],
                                            height: 150.0,
                                            width: MediaQuery.of(context).size.width,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        new SizedBox(height:10.0),
                                        new Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[


                                            new IconButton(
                                                icon: new Icon (Icons.thumb_up, color: Colors.lightGreen,),
                                                onPressed: ()=> debugPrint("like")
                                            ),
                                            new IconButton(
                                                icon: new Icon (Icons.share, color: Colors.lightBlue,),
                                                onPressed: ()=> debugPrint("share")
                                            ),
                                            new IconButton(
                                                icon: new Icon (Icons.thumb_down, color: Colors.redAccent,),
                                                onPressed: ()=> debugPrint("dislike")
                                            ),

                                          ],
                                        )
                                      ],
                                    ),

                                  ]
                              )
                          )
                      );


                    }
                ),
              ),
            ]
        )
    );

  }
}



