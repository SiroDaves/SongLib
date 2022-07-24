import 'dart:convert';

import 'package:flutter/services.dart';

import '../../exports.dart';

class SongDummyService extends SongService {
  List<Song>? songs = <Song>[];

  @override
  Future<List<Song>> getSongs() async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    if (songs!.isEmpty) {
      final jsonString = await rootBundle.loadString('assets/api/songs.json');
      final result = await json.decode(jsonString);

      result.forEach((song) {
        songs!.add(Song.fromJson(song));
      });
    }
    return songs!;
  }
}
