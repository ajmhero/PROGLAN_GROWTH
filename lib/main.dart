import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/home.dart';
import './pages/add_item.dart';
import './pages/schedule.dart';
import './pages/goals.dart';
import './pages/todo.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home : new LandingPage(),
      routes: <String,WidgetBuilder>{
        "/Home":(BuildContext context) => new Home(),
        "/add_item":(BuildContext context) => new AddItem(),
        "/schedule":(BuildContext context) => new Schedule(),
        "/goals":(BuildContext context) => new Goals(),
        "/todo":(BuildContext context) => new TodoList(),
      }
  ));
}