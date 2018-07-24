import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class EditSchedule extends StatefulWidget {
  final List list;
  final int index;

  EditSchedule({this.list, this.index});

  @override
  _EditScheduleState createState() => new _EditScheduleState();
}

class _EditScheduleState extends State<EditSchedule> {
  //alert dialog

  void addedDialog() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Updated schedule"),
      actions: <Widget>[
        new RaisedButton(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Close",
                  style: new TextStyle(
                    color: Colors.white,
                  ))
            ],
          ),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  //form key
  final _formKey = new GlobalKey<FormState>();

  //Time Picker
  TimeOfDay _timeStart = new TimeOfDay.now();
  TimeOfDay _timeEnd = new TimeOfDay.now();
  //picker function

  //pick start
  Future<Null> _selectTimeStart(BuildContext context) async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: _timeStart,
    );
    if (time != null && time != _timeStart) {
      setState(() {
        _timeStart = time;
      });
    }
  }

  //picker TimeENd
  Future<Null> _selectTimeEnd(BuildContext context) async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: _timeEnd,
    );
    if (time != null && time != _timeEnd) {
      setState(() {
        _timeEnd = time;
      });
    }
  }

  //Textbox
  TextEditingController scheduleName;
  TextEditingController timeStart;
  TextEditingController timeEnd;

  //REST API
  void editSchedule() {
    var url = "https://proglangrowth.000webhostapp.com/api/editSchedule.php";

    http.post(url, body: {
      "ScheduleName": scheduleName.text,
      "TimeStart": _timeStart.format(context).toString(),
      "TimeEnd": _timeEnd.format(context).toString(),
      "Archived": "0"
    });
    addedDialog();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add Schedule"),
        backgroundColor: Colors.blueAccent,
      ),
      body: new Form(
        key: _formKey,
        child: new ListView(
          padding: new EdgeInsets.all(20.0),
          children: <Widget>[
            new TextFormField(
              autofocus: false,
              controller: scheduleName,
              decoration: new InputDecoration(
                  hintText: "Schedule Name", labelText: "Schedule Name"),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Fill in the Fields';
                }
              },
            ),
            new Padding(padding: new EdgeInsets.only(top: 30.0)),
            new Column(
              children: <Widget>[
                new Row(children: <Widget>[
                  new Text(
                    "Time Start: " + _timeStart.format(context),
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(right: 10.0),
                  ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new RaisedButton(
                          onPressed: () {
                            _selectTimeStart(context);
                          },
                          textColor: Colors.white,
                          color: Colors.amber,
                          child: new Row(
                            children: <Widget>[new Text("Select Time")],
                          ),
                        )
                      ]),
                ]),
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 30.0)),
            new Column(
              children: <Widget>[
                new Row(children: <Widget>[
                  new Text(
                    "Time End: " + _timeEnd.format(context),
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(right: 10.0),
                  ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new RaisedButton(
                          onPressed: () {
                            _selectTimeEnd(context);
                          },
                          textColor: Colors.white,
                          color: Colors.amberAccent,
                          child: new Row(
                            children: <Widget>[new Text("Select Time")],
                          ),
                        )
                      ]),
                ]),
              ],
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 50.0),
            ),
            new RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  editSchedule();
                }
              },
              color: Colors.blueAccent,
              textColor: Colors.white,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                      padding: new EdgeInsets.only(top: 20.0, bottom: 20.0)),
                  new Text("Update Schedule")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
