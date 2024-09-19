import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_first_app/routes.dart';
import 'package:my_first_app/notifier.dart';

const ITEMS_PER_PAGE = 15;
const CACHE_PAGES = 3;

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PageNotifier(),
      child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
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