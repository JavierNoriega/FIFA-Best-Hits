import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'screens/menuScreen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );

  runApp(
      MaterialApp(
        home: MyApp(),
        debugShowCheckedModeBanner: false,
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FIFA BEST HITS!',
      debugShowCheckedModeBanner: false,
      home: Menu(),
    );
  }

}

// TODO: 1. I had to change info.plist document this        2. Missing support for tablets