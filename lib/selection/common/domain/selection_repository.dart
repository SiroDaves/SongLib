import 'dart:async';

import 'package:http/http.dart';

import '../data/selection_client.dart';

class SelectionRepository {
  final _selectionClient = SelectionClient();

  Future<Response> getBooks() async => await _selectionClient.getBooks();
}
