import 'package:flutter/material.dart';

class Schedule extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
      child: new Container(
          child: new Column(
            children: <Widget>[
                   new AppBar(
                    title: new Text("Schedule"),
                    backgroundColor: Colors.greenAccent,
              ),
            ],
          )
        )
    );
  }
}