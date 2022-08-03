import 'package:injectable/injectable.dart';

import '../../di/environments.dart';
import '../../model/base/song.dart';
import '../../styles/theme_durations.dart';
import '../../util/api/dummy_api_util.dart';
import 'song_service.dart';

@dummy
@Singleton(as: SongService)
class SongDummyService extends SongService {
  final todos = <Song>[];

  @override
  Future<List<Song>> getSongs() async {
    await Future<void>.delayed(ThemeDurations.demoNetworkCallDuration);
    if (todos.isEmpty) {
      final result = await DummyApiUtil.getResponse<List<dynamic>>('Song');
      final newSongs = result
          .map((dynamic item) => Song.fromJson(item as Map<String, dynamic>))
          .toList();
      todos.addAll(newSongs);
    }
    return todos;
  }
}
