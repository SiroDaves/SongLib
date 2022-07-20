import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:integration_test/integration_test.dart';

import 'package:songlib/exports.dart';
import 'package:songlib/main.dart';

Future<void> addDelay(int ms) async {
  await Future<void>.delayed(Duration(milliseconds: ms));
}

Future<void> booksLoading(WidgetTester tester) async {
  // Finders
  Finder pageTitleWidget = find.byKey(
    const ValueKey('${KeyConstants.booksScreen}title'),
  );

  Finder bookItem1 = find.byKey(
    const ValueKey('${KeyConstants.booksScreen}book_item_0'),
  );
  Finder bookItem2 = find.byKey(
    const ValueKey('${KeyConstants.booksScreen}book_item_1'),
  );
  Finder bookItem3 = find.byKey(
    const ValueKey('${KeyConstants.booksScreen}book_item_4'),
  );
  Finder bookItem4 = find.byKey(
    const ValueKey('${KeyConstants.booksScreen}book_item_5'),
  );
  Finder bookItem5 = find.byKey(
    const ValueKey('${KeyConstants.booksScreen}book_item_7'),
  );

  Finder alertCancelBtn = find.byKey(
    const ValueKey('${KeyConstants.booksScreenAlertButton}cancel'),
  );
  Finder alertProceedBtn = find.byKey(
    const ValueKey('${KeyConstants.booksScreenAlertButton}proceed'),
  );

  tester.printToConsole('Books loading screen opens');

  await addDelay(4000);

  expect(pageTitleWidget, findsOneWidget);
  Text text = tester.firstWidget(pageTitleWidget);
  expect(text.data, AppConstants.booksTitle);

  expect(
    find.byKey(const ValueKey('${KeyConstants.booksScreen}sizedbox')),
    findsOneWidget,
  );

  expect(
    find.byKey(const ValueKey(KeyConstants.circularProgress)),
    findsOneWidget,
  );
  tester.printToConsole('Books data loaded from the server');

  await addDelay(3000);
  await tester.pumpAndSettle();

  expect(
    find.byKey(const ValueKey('${KeyConstants.booksScreen}scrollbar')),
    findsOneWidget,
  );

  expect(
    find.byKey(const ValueKey('${KeyConstants.booksScreen}listview')),
    findsOneWidget,
  );

  await addDelay(500);
  await tester.pumpAndSettle();

  await tester.tap(find.byType(FloatingActionButton));
  tester.printToConsole('AreYouDoneDialog opens up');
  await addDelay(1000);
  await tester.pumpAndSettle();

  await tester.ensureVisible(find.byType(AlertButton));
  await tester.pumpAndSettle();
  await tester.tap(find.byType(AlertButton));
  await addDelay(500);

  tester.printToConsole('Closing AreYouDoneDialog after nothing selected');

  await tester.tap(bookItem1);
  await addDelay(500);
  await tester.tap(bookItem2);
  await addDelay(500);
  await tester.tap(bookItem3);
  await addDelay(500);
  await tester.tap(bookItem4);
  await addDelay(500);
  await tester.tap(bookItem5);
  await addDelay(500);

  await tester.tap(find.byType(FloatingActionButton));
  tester.printToConsole('AreYouDoneDialog opens up');
  await addDelay(2000);
  await tester.pumpAndSettle();

  await tester.ensureVisible(alertCancelBtn);
  await tester.ensureVisible(alertProceedBtn);
  await addDelay(500);

  await tester.pumpAndSettle();
  await tester.tap(alertProceedBtn);

  await tester.pumpAndSettle();
}

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // ignore: unnecessary_type_check
  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group('end-to-end test', () {
    testWidgets('Splash Screen Test', (tester) async {
      await GetStorage.init();
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();

      tester.printToConsole('Splash screen opens');

      Finder appIconWidget = find.byKey(const ValueKey(KeyConstants.appIcon));
      expect(appIconWidget, findsOneWidget);

      Image image = tester.firstWidget(appIconWidget) as Image;
      expect(image.image, isNotNull);

      Finder appTitleWidget = find.byKey(const ValueKey(KeyConstants.appTitle));
      expect(appTitleWidget, findsOneWidget);

      Text text = tester.firstWidget(appTitleWidget);
      expect(text.data, AppConstants.appTitle);

      await addDelay(1000);
      await tester.pumpAndSettle();
    });

    testWidgets('Books & Songs Loading Test', (tester) async {
      await GetStorage.init();
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();

      await booksLoading(tester);

    });

    testWidgets('HomeScreen Test', (tester) async {
      await GetStorage.init();
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();

      await booksLoading(tester);

    });
  });
}
