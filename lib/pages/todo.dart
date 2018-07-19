import 'package:flutter/material.dart';

class Todo_list extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
      child: new Container(
          child: new Column(
            children: <Widget>[
                   new AppBar(
                    title: new Text("To Do"),
                    backgroundColor: Colors.deepPurple,
              ),
            ],
          )
        )
    );
  }
}