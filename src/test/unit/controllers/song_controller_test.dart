import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:songlib/exports.dart';

import 'song_controller_test.mocks.dart';

@GenerateMocks([SongController])
void main() {
  test('check if saveNewBook works as expected', () async {
    final controller = MockSongController();

    when(controller.saveSong()).thenAnswer((_) async => true);
    controller.saveSong();
    verify(controller.saveSong());
  });
}
