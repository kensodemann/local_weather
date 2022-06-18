import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:local_weather/models/weather.dart';
import 'package:local_weather/pages/tabs_page.dart';
import 'package:local_weather/theme.dart';
import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Weather(),
      child: MaterialApp(
        title: 'Local Weather',
        theme: theme,
        home: const TabsPage(title: 'Local Weather'),
      ),
    );
  }
}
