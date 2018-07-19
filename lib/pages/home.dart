import 'package:flutter/material.dart';

class Home extends StatelessWidget{
 @override
 Widget build(BuildContext context){
   return new Material(
     child: new Container(
       child: new Column(
         children: <Widget>[
           new AppBar(
             automaticallyImplyLeading: false,
             title: new Text("Growth"),
             backgroundColor: Colors.deepPurpleAccent,
             actions: <Widget>[
               new IconButton(
                 icon: new Icon(Icons.add_circle_outline,color: Colors.white),
                 tooltip: 'Create new schedule',
                 onPressed: (){Navigator.of(context).pushNamed("/add_item");},
               )
             ],
           ),
           new Container(
             padding: new EdgeInsets.all(20.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 new Card(
                   elevation: 2.0,
                   margin: new EdgeInsets.all(10.0),
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new InkWell(
                            onTap: (){Navigator.of(context).pushNamed("/schedule");},
                            child: new Column(
                              children: <Widget>[
                                 new Padding(padding: new EdgeInsets.only(top: 30.0)),
                                 new ListTile(
                                  title: new Text('Schedule',textAlign: TextAlign.center,style: new TextStyle(fontWeight: FontWeight.bold)),
                                    subtitle: new Text('Your schedule for the day',textAlign: TextAlign.center,),
                              ),
                               new Padding(padding: new EdgeInsets.only(top: 30.0)),    
                            ],
                         ),  
                      )
                    ],
                  ),
                ),
                      new Card(
                        elevation: 2.0,
                   margin: new EdgeInsets.all(10.0),
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new InkWell(
                            onTap: (){Navigator.of(context).pushNamed("/todo");},
                            child: new Column(
                              children: <Widget>[
                                 new Padding(padding: new EdgeInsets.only(top: 30.0)),
                                 new ListTile(
                                  title: new Text('To Do List',textAlign: TextAlign.center,style: new TextStyle(fontWeight: FontWeight.bold)),
                                    subtitle: new Text('Your List of things to do',textAlign: TextAlign.center,),
                              ),
                               new Padding(padding: new EdgeInsets.only(top: 30.0)),    
                            ],
                         ),  
                      )
                    ],
                  ),
                ),
                  new Card(
                  elevation: 2.0,
                   margin: new EdgeInsets.all(10.0),
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new InkWell(
                            onTap: (){Navigator.of(context).pushNamed("/goals");},
                            child: new Column(
                              children: <Widget>[
                                 new Padding(padding: new EdgeInsets.only(top: 30.0)),
                                 new ListTile(
                                  title: new Text('Goals',textAlign: TextAlign.center,style: new TextStyle(fontWeight: FontWeight.bold)),
                                    subtitle: new Text('Your Goals to reach for the day',textAlign: TextAlign.center,),
                              ),
                               new Padding(padding: new EdgeInsets.only(top: 30.0)),    
                            ],
                         ),  
                      )
                    ],
                  ),
                )              
               ],
             )
           )
         ],
       ),
     ),
   );
 }
}