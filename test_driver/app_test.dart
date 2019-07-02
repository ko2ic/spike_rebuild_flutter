import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    final listTitleFinder = find.byValueKey('in case of setState');
    final counterTextFinder = find.byValueKey('Text of setState');

    final buttonFinder = find.byValueKey('Button of setState');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('setState画面に遷移する', () async {
      await driver.tap(listTitleFinder);
    });

    test('最初のカウントは0', () async {
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('ボタンを押下してカウントアップ', () async {
      await driver.tap(buttonFinder);

      expect(await driver.getText(counterTextFinder), "1");
    });
  });
}
