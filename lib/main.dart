import 'package:flutter/material.dart';
import 'package:gallery_app/home.dart';

void main(List<String> args) {
  runApp(const App());
}
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    home:  Home(),
    );
  }
}
