import 'dart:async';

import 'package:http/http.dart';

import '../data/selecting_client.dart';

class SelectingRepository {
  final _selectingClient = SelectingClient();

  Future<Response> getBooks() async => await _selectingClient.getBooks();
}
