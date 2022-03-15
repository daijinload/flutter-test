import 'package:flutter_main/views/1_root/main_root.dart';
import 'package:flutter_main/views/2_page/home_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';

// flutter test -d linux test/integration_test/views/2_page/home_page_test.dart
// flutter test test/integration_test/views/2_page/home_page_test.dart

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('ホーム画面テスト', () {
    setUp(() {});
    testWidgets('ボタンを押したら遷移すること', (WidgetTester tester) async {
      await tester.pumpWidget(Builder(builder: (BuildContext context) {
        return createMaterialApp(context, const HomePage());
      }));
      await tester.tap(find.text('二次元バーコードを読み込む'));
      await tester.pumpAndSettle();
      // 遷移後、ヘッダーの文字が変化することを確認
      expect(find.text('機器の設定'), findsOneWidget);
    });
  });
}
