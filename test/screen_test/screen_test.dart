import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget Size Test', (WidgetTester tester) async {
    // テスト用のWidgetを作成
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 100,
              height: 50,
              child: Text('Test Widget'),
            ),
          ),
        ),
      ),
    );

    // SizedBoxのサイズを検証
    final sizedBoxFinder = find.byType(SizedBox);
    expect(sizedBoxFinder, findsOneWidget);

    final sizedBox = tester.widget<SizedBox>(sizedBoxFinder);
    expect(sizedBox.width, 100);
    expect(sizedBox.height, 50);

    // レンダリングされたWidgetのサイズを検証
    final renderBox = tester.renderObject<RenderBox>(sizedBoxFinder);
    expect(renderBox.size.width, 100);
    expect(renderBox.size.height, 50);
  });

  testWidgets('Container Size Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
            width: 200,
            height: 150,
            color: Colors.blue,
            child: const Text('Container Test'),
          ),
        ),
      ),
    );

    final containerFinder = find.byType(Container);
    final renderBox = tester.renderObject<RenderBox>(containerFinder);

    expect(renderBox.size.width, 200);
    expect(renderBox.size.height, 150);
  });
}