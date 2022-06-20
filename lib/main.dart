import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:local_weather/models/user_preferences.dart';
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
    final httpClient = http.Client();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Weather>(
          create: (_) => Weather(httpClient),
        ),
        ChangeNotifierProvider<UserPreferences>(
          create: (_) => UserPreferences(),
        ),
      ],
      child: MaterialApp(
        title: 'Local Weather',
        theme: theme,
        home: const TabsPage(),
      ),
    );
  }
}
