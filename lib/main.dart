import 'package:finishpdp/pages/creativ_pages.dart';
import 'package:finishpdp/pages/home_pages.dart';
import 'package:finishpdp/pages/update.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(key: null,),
      routes: {
        HomePage.id: (context) => HomePage(key: null,),
        CreatePage.id: (context) => CreatePage(),
        UpdatePage.id: (context) => UpdatePage(),
      },
    );
  }
}