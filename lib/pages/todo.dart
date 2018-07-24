import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoList extends StatefulWidget {
  @override
  _TodoState createState() => new _TodoState();
}

class _TodoState extends State<TodoList> {
  Future<List> getGoals() async {
    final response = await http
        .get("https://proglangrowth.000webhostapp.com/api/getTodo.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("To Do List"),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add_circle_outline, color: Colors.white),
            tooltip: 'Create new schedule',
            onPressed: () {
              Navigator.of(context).pushNamed("/add_todo");
            },
          )
        ],
      ),
      body: new FutureBuilder<List>(
        future: getGoals(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(
                    backgroundColor: Colors.blueGrey,
                  ),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {


  void deleteSchedule(String id) {
    var url = "https://proglangrowth.000webhostapp.com/api/deleteTodo.php";
    http.post(url, body: {'ToDoID': id, 'Archived': "1"});
  }

  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    void deleteDialog(String id, String name) {
      AlertDialog alertDialog = new AlertDialog(
        content: new Text("Clear " + name.toLowerCase() + " Task?"),
        actions: <Widget>[
          new FlatButton(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Close",
                    style: new TextStyle(
                      color: Colors.redAccent,
                    ))
              ],
            ),
            onPressed: () => Navigator.pop(context),
          ),
          new RaisedButton(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Yes",
                    style: new TextStyle(
                      color: Colors.white,
                    ))
              ],
            ),
            color: Colors.green,
            onPressed: () {
              deleteSchedule(id);
              Navigator.pop(context);
              Navigator.popAndPushNamed(context, "/todo");
            },
          ),
        ],
      );

      showDialog(context: context, child: alertDialog);
    }

    void chooseDialog(String id, String name) {
      AlertDialog alertDialog = new AlertDialog(
          content: new Container(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new FlatButton(
                  onPressed: null,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "Edit " + name.toLowerCase(),
                        style:
                            new TextStyle(fontSize: 15.0, color: Colors.black),
                      )
                    ],
                  ),
                )
              ],
            ),
            new Row(
              children: <Widget>[
                new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    deleteDialog(id, name);
                  },
                  child: new Row(
                    children: <Widget>[
                      new Text(
                        "Delete " + name.toLowerCase(),
                        style: new TextStyle(
                            fontSize: 15.0, color: Colors.redAccent),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ));
      showDialog(context: context, child: alertDialog);
    }

    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(5.0),
          child: new InkWell(
            onLongPress: () =>
                chooseDialog(list[i]['ToDoID'], list[i]['ItemName']),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['ItemName']),
                leading: new Icon(Icons.widgets),
                
              ),
            ),
          ),
        );
      },
    );
  }
}
