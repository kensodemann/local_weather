import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_weather/models/condition.dart';
import 'package:local_weather/widgets/condition_image.dart';

void main() {
  testWidgets('displays the condition image', (tester) async {
    final condition = Condition.fromRawCondition(212);
    await tester.pumpWidget(ConditionImage(condition));
    final image = find.byType(Image).evaluate().single.widget as Image;
    expect((image.image as AssetImage).assetName, condition.image);
  });
}
