import 'package:flutter/material.dart';

class UVIndexPage extends StatelessWidget {
  const UVIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'UV Index',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
