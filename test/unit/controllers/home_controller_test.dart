import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:songlib/app/exports.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([HomeController])
void main() {
  group('home provider', () {
    test('check if fetchBooks works as expected', () async {
      final controller = MockHomeController();

      when(
        controller.fetchBooks(),
      ).thenAnswer(
        (_) async => controller.tasks = [
          Book(title: 'this task'),
        ],
      );
      controller.fetchBooks();

      verify(controller.fetchBooks());
    });
  });
}
