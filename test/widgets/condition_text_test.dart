import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_weather/models/condition.dart';
import 'package:local_weather/widgets/condition_text.dart';

void main() {
  testWidgets('displays the condition text', (tester) async {
    final condition = Condition.fromRawCondition(212);
    await tester
        .pumpWidget(MaterialApp(title: 'Test', home: ConditionText(condition)));
    expect(find.text(condition.description), findsOneWidget);
  });
}
