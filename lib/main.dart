import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepper/contactpage.dart';
import 'package:stepper/detailpage.dart';
import 'package:stepper/homepage.dart';
import 'package:stepper/themeprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Themeprovider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  get provider => null;

  @override
  Widget build(BuildContext context) {
    Themeprovider themeprovider = Provider.of<Themeprovider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeprovider.isDark
          ? ThemeData(brightness: Brightness.dark,useMaterial3: true)
          : ThemeData(brightness: Brightness.light,useMaterial3: true),
      routes: {
        '/': (context) => homepage(),
        'contactpage': (context) => contactpage(),
        'detailpage': (context) => detailpage(),
      },
    );
  }
}
