import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_tips/case_check/case_check.dart';

void main() {
  group('CaseCheck Widget Tests', () {
    testWidgets('初期状態ではチェックされていない', (WidgetTester tester) async {
      // Widget をビルド
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CaseCheck(),
          ),
        ),
      );

      // CheckboxListTile を検索
      final checkboxFinder = find.byKey(const Key('case-check'));
      expect(checkboxFinder, findsOneWidget);

      // CheckboxListTile ウィジェットを取得
      final CheckboxListTile checkbox = tester.widget(checkboxFinder);
      
      // 初期状態がfalseであることを確認
      expect(checkbox.value, false);
      print('テストケース: 初期状態 - チェックされていません (value: ${checkbox.value})');
    });

    testWidgets('チェックボックスをタップしてtrueにする', (WidgetTester tester) async {
      // Widget をビルド
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CaseCheck(),
          ),
        ),
      );

      final checkboxFinder = find.byKey(const Key('case-check'));
      
      // チェックボックスをタップ
      await tester.tap(checkboxFinder);
      await tester.pump();

      // CheckboxListTile ウィジェットを取得
      final CheckboxListTile checkbox = tester.widget(checkboxFinder);
      
      // 状態がtrueに変わったことを確認
      expect(checkbox.value, true);
      print('テストケース: タップ後 - チェックされています (value: ${checkbox.value})');
    });

    testWidgets('チェックボックスを再度タップしてfalseに戻す', (WidgetTester tester) async {
      // Widget をビルド
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CaseCheck(),
          ),
        ),
      );

      final checkboxFinder = find.byKey(const Key('case-check'));
      
      // 最初のタップでtrueにする
      await tester.tap(checkboxFinder);
      await tester.pump();
      
      CheckboxListTile checkbox = tester.widget(checkboxFinder);
      expect(checkbox.value, true);
      print('テストケース: 1回目のタップ - チェックされています (value: ${checkbox.value})');

      // 2回目のタップでfalseに戻す
      await tester.tap(checkboxFinder);
      await tester.pump();

      checkbox = tester.widget(checkboxFinder);
      expect(checkbox.value, false);
      print('テストケース: 2回目のタップ - チェックされていません (value: ${checkbox.value})');
    });

    testWidgets('チェックボックスの状態変化を連続でテスト', (WidgetTester tester) async {
      // Widget をビルド
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CaseCheck(),
          ),
        ),
      );

      final checkboxFinder = find.byKey(const Key('case-check'));
      CheckboxListTile checkbox;

      // 複数回の状態変化をテスト
      for (int i = 0; i < 3; i++) {
        // タップしてtrueにする
        await tester.tap(checkboxFinder);
        await tester.pump();
        
        checkbox = tester.widget(checkboxFinder);
        expect(checkbox.value, true);
        print('テストケース: ${i + 1}回目のON - チェックされています (value: ${checkbox.value})');

        // 再度タップしてfalseにする
        await tester.tap(checkboxFinder);
        await tester.pump();
        
        checkbox = tester.widget(checkboxFinder);
        expect(checkbox.value, false);
        print('テストケース: ${i + 1}回目のOFF - チェックされていません (value: ${checkbox.value})');
      }
    });
  });
}