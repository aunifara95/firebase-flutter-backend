import 'package:flutter/material.dart';



class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Second Page"),
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
              child: Text("Table", textScaleFactor: 2,
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent,)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                textDirection: TextDirection.ltr,
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border:TableBorder.all(width: 3.0, color: Colors.black26),

                children: [
                  TableRow(
                      children: [
                        Text("Name", textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,)),
                        Text("Email", textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,)),
                        Text("Address", textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,)),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("B.Tech", textScaleFactor: 1.5),
                        Text("ABESEC", textScaleFactor: 1.5),
                        Text("AKTU", textScaleFactor: 1.5),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("12th", textScaleFactor: 1.5),
                        Text("Delhi Public School", textScaleFactor: 1.5),
                        Text("CBSE", textScaleFactor: 1.5),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("High School", textScaleFactor: 1.5),
                        Text("SFS", textScaleFactor: 1.5),
                        Text("ICSE", textScaleFactor: 1.5),
                      ]
                  ),
                ],
              ),
            ),
          ]
      ),
    );


  }
}