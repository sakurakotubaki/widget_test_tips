import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_tips/navigation_test/main.dart';

void main() {
  testWidgets('画面遷移テスト: Home -> Details -> Home', (WidgetTester tester) async {
    // MyAppをテスト環境で起動
    await tester.pumpWidget(const MyApp());

    // ホーム画面が表示されていることを確認
    expect(find.text('Home Screen'), findsOneWidget);
    expect(find.text('Go to the Details screen'), findsOneWidget);

    // 詳細画面へ遷移
    await tester.tap(find.text('Go to the Details screen'));
    await tester.pumpAndSettle();

    // 詳細画面が表示されていることを確認
    expect(find.text('Details Screen'), findsOneWidget);
    expect(find.text('Go back to the Home screen'), findsOneWidget);

    // ホーム画面へ戻る
    await tester.tap(find.text('Go back to the Home screen'));
    await tester.pumpAndSettle();

    // 再びホーム画面が表示されていることを確認
    expect(find.text('Home Screen'), findsOneWidget);
  });
}
