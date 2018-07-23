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
    final response = await http.get("https://proglangrowth.000webhostapp.com/api/getTodo.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("To Do List"),
        backgroundColor: Colors.redAccent,
        actions:<Widget>[
               new IconButton(
                 icon: new Icon(Icons.add_circle_outline,color: Colors.white),
                 tooltip: 'Create new schedule',
                 onPressed: (){Navigator.of(context).pushNamed("/add_item");},
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
                  child: new CircularProgressIndicator(backgroundColor: Colors.blueGrey,),
                );
        },
      ),
    );
    }
  }

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(5.0),
          child: new GestureDetector(
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['GoalName']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text(list[i]['Status']),
              ),
            ),
          ),
        );
      },
    );
  }
}