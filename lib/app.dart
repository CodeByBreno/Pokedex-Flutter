import 'package:flutter/material.dart';
import 'package:my_first_app/routes.dart';

const ITEMS_PER_PAGE = 15;
const CACHE_PAGES = 3;

class App extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<App> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      initialRoute: '/',
      routes: routes(context),
      debugShowCheckedModeBanner: false,
    );
  }
}