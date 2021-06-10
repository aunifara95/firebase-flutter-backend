import 'package:flutter/material.dart';



class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Login Page"),
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
      body: MyCustomForm(),

    );

  }
}
// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Full Name: ',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'Enter your phone number',
              labelText: 'Phone Number: ',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter valid phone number';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.email),
              hintText: 'Enter your email',
              labelText: 'Email: ',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          new Container(
            padding: const EdgeInsets.only(left: 150.0, top: 40.0),
            // ignore: deprecated_member_use
            child: new RaisedButton(
                child: const Text('Submit'),
                onPressed: ()=> {
                  // It returns true if the form is valid, otherwise returns false
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context)
                    // ignore: deprecated_member_use
                        .showSnackBar(SnackBar(content: Text('Data is in processing.')))},
                }
            ),
          ),
        ],
      ),
    );
  }
}


