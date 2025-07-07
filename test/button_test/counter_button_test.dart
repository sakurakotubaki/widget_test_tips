import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_tips/button_test/counter_button.dart';

/// このファイルはCounterButtonウィジェットのテストコードです。
///
/// テストの目的:
/// - ボタンが10回連打された場合、カウンターが10になることを確認します。
///
/// テストの書き方:
/// 1. テスト対象のウィジェットをpumpWidgetで構築します。
/// 2. ボタンをKeyで検索します。
/// 3. for文を使って10回ボタンをタップします。
/// 4. カウンターの値が10になっていることを検証します。
///
/// for文を使う理由:
/// - ボタンを複数回（この場合10回）連続で押す動作を簡潔に記述できるためです。
/// - 同じ処理を繰り返す場合、for文を使うことでコードの可読性と保守性が向上します。

void main() {
  testWidgets('Counter button can be tapped 10 times', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: CounterButton(),
      ),
    );

    // Verify initial counter is 0
    expect(find.text('0'), findsOneWidget);

    // Find the increment button using its key
    final incrementButton = find.byKey(const Key('increment_button'));
    expect(incrementButton, findsOneWidget);

    // Tap the button 10 times
    for (int i = 0; i < 10; i++) {
      await tester.tap(incrementButton);
      await tester.pump();
    }

    // Verify counter shows 10
    expect(find.text('10'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });
}
