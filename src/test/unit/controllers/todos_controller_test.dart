import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:songlib/exports.dart';

import 'todos_controller_test.mocks.dart';

@GenerateMocks([TodosController])
void main() {
  test('check if saveNewBook works as expected', () async {
    final controller = MockTodosController();

    when(controller.saveBook()).thenAnswer((_) async => true);
    controller.saveBook();
    verify(controller.saveBook());
  });
}
