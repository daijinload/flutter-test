import 'package:flutter_main/views/1_root/main_root.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';

// flutter test -d linux test/integration_test/views/2_page/user_page2_test.dart

void main() {
  // インテグレーションテスト（http通信ありのテスト）をする場合に必要。
  // 下記が無い状態のwidgetテストだと、http通信が全てstatus=400の空文字にモック化されてしまう。
  // rootディレクトリに、integration_testフォルダを作ってテストを実行するとエミュレータなどが
  // 起動してスクショが取れたりするが、毎度起動してテスト実施すると遅いので、
  // 開発時はtestフォルダで実行するのが良いかと思う。
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('ユーザ情報表示テスト', () {
    testWidgets('初回は空文字で表示すること', (WidgetTester tester) async {
      await tester.pumpWidget(const MainRoot());
      expect(find.text(''), findsOneWidget);
      expect(find.text('{"name":"hello"}'), findsNothing);
    });
    testWidgets('ボタンを押したら、アラートが表示されて、アラートの文字そのままボタンを押すと、json文字列が表示されていること',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MainRoot());
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await tester.tap(find.text('文字そのまま'));
      await tester.pumpAndSettle();
      expect(find.text('{"name":"hello"}'), findsOneWidget);

      // for (var item in tester.allElements) {
      //   print('-----------------------------------------------------------');
      //   print(item.toString());
      // }
    });
  });
}
