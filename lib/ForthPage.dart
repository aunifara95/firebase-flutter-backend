import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Record {
  final String Name;
  final String Email;
  final String Phone;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {required this.reference})
      : assert(map['Name'] != null),
        assert(map['Email'] != null),
        assert(map['Phone'] != null),
        Name = map['Name'],
        Email = map['Email'],
        Phone = map['Phone'];

  Record.fromSnapshot(snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$Name:$Phone:$Email>";
}

class ForthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Details'),
        backgroundColor: Colors.orange,),

      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('baby').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return DataTable(
            columns: [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Phone')),
              DataColumn(label: Text('Email')),
            ],
            rows: _buildList(context, snapshot.data!.docs)
        );
      },
    );
  }




  List<DataRow> _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return  snapshot.map((data) => _buildListItem(context, data)).toList();
  }

  DataRow _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return DataRow(cells: [
      DataCell(Text(record.Name)),
      DataCell(Text(record.Phone)),
      DataCell(Text(record.Email)),
    ]);
  }
}


