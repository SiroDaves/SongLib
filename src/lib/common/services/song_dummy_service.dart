import 'dart:convert';

import 'package:flutter/services.dart';

import '../../exports.dart';

class SongDummyService extends SongService {
  final songs = <Song>[];

  @override
  Future<List<Song>> getSongs() async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    if (songs.isEmpty) {
      final jsonString = await rootBundle.loadString('assets/api');
      final result = await json.decode(jsonString) as List<Song>;
      final newSongs = result
          .map((dynamic item) => Song.fromJson(item as Map<String, dynamic>))
          .toList();
      songs.addAll(newSongs);
    }
    return songs;
  }
}
