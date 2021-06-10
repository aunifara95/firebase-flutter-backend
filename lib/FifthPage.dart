import 'package:flutter/material.dart';



class FifthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Pie Chart"),
            backgroundColor: Colors.purple,
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.home),
                  onPressed: () {
                    Navigator.pop(context);
                  }
              ),
            ]
        ),
        body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("i'm going to do a pie chart here", textScaleFactor: 2,
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pinkAccent,)
                ),
              ),
            ]
        )
    );
  }
}