import 'package:flutter/material.dart';
import 'package:flutter_todo_app_c8_fri/home/home_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
      },
    );
  }
}
