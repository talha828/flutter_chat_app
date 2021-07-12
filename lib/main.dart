import 'package:chat_app_flutter/welcomeScreen.dart';
import 'package:flutter/material.dart';

void main()  {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.blue,

      ),
      home: Screen(),
    );
  }
}
class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.blue,
     appBar: AppBar(
       elevation: 0.0,
       title: Center(child: Text("Group Chat 💬")),
     ),
      body:WelcomeScreen(),
    );
  }
}

