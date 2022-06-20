import 'package:flutter/material.dart';
import 'package:local_weather/models/weather.dart';
import 'package:local_weather/pages/current_weather_page.dart';
import 'package:local_weather/pages/forecast_page.dart';
import 'package:local_weather/pages/uv_index_page.dart';
import 'package:provider/provider.dart';

class _Page {
  final Widget page;
  final String title;

  const _Page({
    required this.page,
    required this.title,
  });
}

class TabsPage extends StatefulWidget {
  const TabsPage({
    Key? key,
  }) : super(key: key);

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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Weather>(context, listen: false).load();
    });
    super.initState();
  }

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
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Theme.of(context).colorScheme.secondary, Colors.white],
          ),
        ),
        child: _pages[_currentTabIndex].page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
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
