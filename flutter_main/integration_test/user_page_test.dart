import 'package:flutter_main/views/1_root/main_root.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';

// flutter drive -d emulator --screenshot=/tmp/aaa --driver=test_driver/integration_test.dart --target=integration_test/user_page_test.dart

void main() async {
  // スクショ型のインテグレーションテスト（http通信ありのテスト）をする場合に必要。
  // 2022-02-28現在、Androidのエミュレータでしか動かないっぽい。
  final binding = IntegrationTestWidgetsFlutterBinding();

  group('MyWidget', () {
    testWidgets('should display a string of text', (WidgetTester tester) async {
      String platformName = 'web';

      if (!kIsWeb) {
        // Not required for the web. This is required prior to taking the screenshot.
        await binding.convertFlutterSurfaceToImage();

        if (Platform.isAndroid) {
          platformName = "android";
        } else {
          platformName = "ios";
        }
      }

      await tester.pumpWidget(const MainRoot());
      expect(find.text(''), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await binding.takeScreenshot('screenshot-$platformName');
    });
  });
}
