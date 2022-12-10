import 'package:injectable/injectable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../models/base/book.dart';
import '../models/base/edit.dart';
import '../models/base/song.dart';
import '../models/general/notifycation.dart';
import '../utils/constants/api_constants.dart';
import '../utils/constants/utilities.dart';
import 'web_service.dart';

@injectable
@LazySingleton(as: WebService)
class ApiClient implements WebService {
  @override
  Future<List<ParseObject>> queryBooks() async {
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject(ApiConstants.book));
    parseQuery
      ..whereEqualTo('enabled', true)
      ..orderByAscending('position');
    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<List<Book>> fetchBooks() async {
    final List<Book> books = [];
    final List<ParseObject> objects = await queryBooks();
    if (objects.isNotEmpty) {
      for (final object in objects) {
        final Book book = Book(
          objectId: object.get<String>('objectId'),
          id: object.get<int>('id'),
          bookNo: object.get<int>('bookNo'),
          title: object.get<String>('title'),
          subTitle: object.get<String>('subTitle'),
          position: object.get<int>('position'),
          songs: object.get<int>('songs'),
          enabled: object.get<bool>('enabled'),
          createdAt: dateToString(object.get<DateTime>('createdAt')!),
          updatedAt: dateToString(object.get<DateTime>('updatedAt')!),
        );
        books.add(book);
      }
    }
    return books;
  }

  @override
  Future<List<ParseObject>> queryEdits(List<int> books) async {
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject(ApiConstants.song));
    parseQuery
      ..whereContainedIn('book', books)
      ..orderByAscending('songNo')
      ..setLimit(10000);
    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<List<Edit>> fetchEdits(List<int> books) async {
    final List<Edit> songs = [];
    final List<ParseObject> objects = await queryEdits(books);
    if (objects.isNotEmpty) {
      for (final object in objects) {
        final Edit song = Edit(
          objectId: object.get<String>('objectId'),
          id: object.get<int>('id'),
          book: object.get<int>('book'),
          songNo: object.get<int>('songNo'),
          title: object.get<String>('title'),
          alias: object.get<String>('alias'),
          content: object.get<String>('content'),
          author: object.get<String>('author'),
          key: object.get<String>('key'),
          views: object.get<int>('views'),
          likes: object.get<int>('likes'),
          liked: object.get<bool>('liked'),
          createdAt: dateToString(object.get<DateTime>('createdAt')!),
          updatedAt: dateToString(object.get<DateTime>('updatedAt')!),
        );
        songs.add(song);
      }
    }
    return songs;
  }

  @override
  Future<List<ParseObject>> queryNotifycations() async {
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject(ApiConstants.Notifycation));
    parseQuery.whereEqualTo('enabled', true);
    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<List<Notifycation>> fetchNotifycations() async {
    final List<Notifycation> notifycations = [];
    final List<ParseObject> objects = await queryNotifycations();
    if (objects.isNotEmpty) {
      for (final object in objects) {
        final Notifycation notifycation = Notifycation(
          objectId: object.get<String>('objectId'),
          title: object.get<String>('title'),
          message: object.get<String>('message'),
          image: object.get<String>('image'),
          views: object.get<int>('views'),
          createdAt: dateToString(object.get<DateTime>('createdAt')!),
          updatedAt: dateToString(object.get<DateTime>('updatedAt')!),
        );
        notifycations.add(notifycation);
      }
    }
    return notifycations;
  }

  @override
  Future<List<ParseObject>> querySongs(List<int> books) async {
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject(ApiConstants.song));
    parseQuery
      ..whereContainedIn('book', books)
      ..orderByAscending('songNo')
      ..setLimit(10000);
    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<List<Song>> fetchSongs(List<int> books) async {
    final List<Song> songs = [];
    final List<ParseObject> objects = await querySongs(books);
    if (objects.isNotEmpty) {
      for (final object in objects) {
        final Song song = Song(
          objectId: object.get<String>('objectId'),
          id: object.get<int>('id'),
          book: object.get<int>('book'),
          songNo: object.get<int>('songNo'),
          title: object.get<String>('title'),
          alias: object.get<String>('alias'),
          content: object.get<String>('content'),
          author: object.get<String>('author'),
          key: object.get<String>('key'),
          views: object.get<int>('views'),
          likes: object.get<int>('likes'),
          liked: object.get<bool>('liked'),
          createdAt: dateToString(object.get<DateTime>('createdAt')!),
          updatedAt: dateToString(object.get<DateTime>('updatedAt')!),
        );
        songs.add(song);
      }
    }
    return songs;
  }
}
