import 'package:flutter/material.dart';
import 'package:weather_app/homepage.dart';
import 'package:weather_app/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.fallback(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
      routes: {
        '/weather': (context) => MyHomePage(cityName: '',),
      },
    );
  }
}
