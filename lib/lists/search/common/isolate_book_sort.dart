import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';

import '../../../data/models/songext.dart';

class BookSort {
  BookSort._();

  static Future<List<SongExt>> isolate(
      int bookNo, List<SongExt> songs) async {
    final receivePort = ReceivePort();
    await Isolate.spawn(
      _sortIsolate,
      _BookSortParams(
        bookNo: bookNo,
        songs: songs,
        sendPort: receivePort.sendPort,
      ),
    );

    final completer = Completer<List<SongExt>>();
    receivePort.listen((message) {
      completer.complete(message);
      receivePort.close();
    });
    return completer.future;
  }

  static void _sortIsolate(_BookSortParams params) {
    final List<SongExt> sortedList = [];
    for (final song in params.songs) {
      if (song.book == params.bookNo) {
        sortedList.add(song);
      }
    }
    sortedList.sort((a, b) => a.title.compareTo(b.title));
    params.sendPort.send(sortedList);
  }
}

@immutable
class _BookSortParams {
  final int bookNo;
  final List<SongExt> songs;
  final SendPort sendPort;

  const _BookSortParams({
    required this.bookNo,
    required this.songs,
    required this.sendPort,
  });
}
