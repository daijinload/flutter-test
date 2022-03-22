import 'package:flutter_main/common/my_config.dart';
import 'package:flutter_main/views/1_root/main_root.dart';
import 'package:flutter_main/views/2_page/user_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_main/src/3_infrastructures/flutter/story/usecase_mock.dart'
    as usecase_mock;

// flutter test -d linux test/integration_test/views/2_page/user_page_test.dart

void main() async {
  // 環境変数のセットアップをする（テスト用の共通処理に移動しても良いかも）
  await setupMyConfig(isTest: true);

  // インテグレーションテスト（http通信ありのテスト）をする場合に必要。
  // 下記が無い状態のwidgetテストだと、http通信が全てstatus=400の空文字にモック化されてしまう。
  // rootディレクトリに、integration_testフォルダを作ってテストを実行するとエミュレータなどが
  // 起動してスクショが取れたりするが、毎度起動してテスト実施すると遅いので、
  // 開発時はtestフォルダで実行するのが良いかと思う。
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // API起動しないとエラーになるため、面倒なのでモックで動かす。
  usecase_mock.exec();

  group('ユーザ情報表示テスト', () {
    testWidgets('初回は空文字で表示すること', (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (BuildContext context) {
        return createMaterialApp(context, const UserPage());
      }));

      expect(find.text(''), findsOneWidget);
      expect(find.text('Mock文字列!!'), findsNothing);
    });
    testWidgets('ボタンを押したら、アラートが表示されて、アラートの文字そのままボタンを押すと、json文字列が表示されていること',
        (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (BuildContext context) {
        return createMaterialApp(context, const UserPage());
      }));

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await tester.tap(find.text('文字そのまま'));
      await tester.pumpAndSettle();
      expect(find.text('Mock文字列!!'), findsOneWidget);

      // for (var item in tester.allElements) {
      //   print('-----------------------------------------------------------');
      //   print(item.toString());
      // }
    });
  });
}
