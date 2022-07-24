import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:songlib/exports.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([HomeController])
void main() {
  group('home provider', () {
    test('check if fetchBooks works as expected', () async {
      final controller = MockHomeController();

      when(
        controller.fetchBookList(),
      ).thenAnswer(
        (_) async => controller.booksList = [
          //Book(title: 'this book'),
        ],
      );
      controller.fetchBookList();

      verify(controller.fetchBookList());
    });
  });
}
