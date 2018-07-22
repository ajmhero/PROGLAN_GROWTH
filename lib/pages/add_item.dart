import 'package:flutter/material.dart';
import './home.dart';

class AddItem extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
     title: 'Add Items',
     routes: <String,WidgetBuilder>{
        "/Home":(BuildContext context) => new Home(),
      },
      home: new Scaffold(
        appBar: new AppBar(
            automaticallyImplyLeading: true,
            leading: new IconButton(
            icon: new Icon(Icons.arrow_back,color: Colors.white),
            tooltip: 'Create new schedule',
            onPressed: (){Navigator.pop(context, '/Home');},
            
          ),
          title: new Text('Add Items'),
        ),
        body: new MyCustomForm(),
      ),
    );
  }
}

// Create a Form Widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return new MyCustomFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return new Form(
      key: _formKey,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         new TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            },
          ),
        new Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: new RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
          
                 Scaffold
             .of(context)
              .showSnackBar(new SnackBar(content: new Text('Processing Data')));
                }
              },
              child:
              new Row(
                children: <Widget>[
                    new Text('Submit')
                ],
              ) 
            ),
          ),
        ],
      ),
    );
  }
}