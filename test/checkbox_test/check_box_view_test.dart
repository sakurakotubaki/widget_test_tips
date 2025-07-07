import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_tips/check_box_view/check_box_view.dart';

/// チェックボックスのON/OFF切り替えができることをテストします。
///
/// - 初期状態はOFF(false)であることを確認します。
/// - チェックボックスをタップしてON(true)になることを確認します。
/// - さらにもう一度タップしてOFF(false)に戻ることを確認します。
// テストでCheckBoxViewを表示するためには、Materialデザインのコンテキストが必要です。
// そのため、MaterialAppとScaffoldでCheckBoxViewをラップしています。
// Scaffoldがないと、CheckboxListTileなどのMaterialウィジェットが正しく動作しません。
void main() {
  testWidgets('CheckBox toggles between ON/OFF (true/false)', (WidgetTester tester) async {
    // ウィジェットをビルド
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CheckBoxView(),
        ),
      ),
    );

    // 初期状態はOFF(false)
    final checkboxFinder = find.byType(CheckboxListTile);
    expect(checkboxFinder, findsOneWidget);

    CheckboxListTile tile = tester.widget(checkboxFinder);
    expect(tile.value, isFalse);

    // チェックボックスをタップしてON(true)に
    await tester.tap(checkboxFinder);
    await tester.pumpAndSettle();

    tile = tester.widget(checkboxFinder);
    expect(tile.value, isTrue);

    // もう一度タップしてOFF(false)に
    await tester.tap(checkboxFinder);
    await tester.pumpAndSettle();

    tile = tester.widget(checkboxFinder);
    expect(tile.value, isFalse);
  });
}
