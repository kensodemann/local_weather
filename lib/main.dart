import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:local_weather/pages/tabs_page.dart';
import 'package:local_weather/theme.dart';

Future main() async {
  await dotenv.load();
  print(dotenv.env['WEATHER_KEY']);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const TabsPage(title: 'Flutter Demo Home Page'),
    );
  }
}
