import 'package:flutter/material.dart';
import 'package:local_weather/pages/current_weather_page.dart';
import 'package:local_weather/pages/forecast_page.dart';
import 'package:local_weather/pages/uv_index_page.dart';

class _Page {
  final Widget page;
  final String title;

  const _Page({
    required this.page,
    required this.title,
  });
}

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final _pages = const [
    _Page(
      page: CurrentWeatherPage(),
      title: 'Current Weather',
    ),
    _Page(
      page: ForecastPage(),
      title: 'Forecasts',
    ),
    _Page(
      page: UVIndexPage(),
      title: 'UV Index',
    ),
  ];

  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_currentTabIndex].title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [Theme.of(context).colorScheme.secondary, Colors.white],
          ),
        ),
        child: _pages[_currentTabIndex].page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.white,
        currentIndex: _currentTabIndex,
        onTap: (idx) => setState(() => _currentTabIndex = idx),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Current Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Forecast',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'UV Index',
          ),
        ],
      ),
    );
  }
}
