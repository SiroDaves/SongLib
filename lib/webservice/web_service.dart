import '../model/webservice/books_response.dart';
import '../model/webservice/notifications_response.dart';
import '../model/webservice/songs_response.dart';

// ignore: one_member_abstracts
abstract class WebService {
  Future<BooksResponse?> getBooksResponse();

  Future<NotificationsResponse?> getNotificationsResponse();
  
  Future<SongsResponse?> getSongsResponse(String where);
}
