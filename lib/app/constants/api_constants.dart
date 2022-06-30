class ApiConstants {
  static const parseUrl = "https://parseapi.back4app.com/classes/";
  static const parseAppID = "vuzJgKGqPqx7HUhx2dgjokgZinPUppmygSOfYBSg";
  static const parseApiKey = "9s9zQYmaNMGf9BXWRfuWmgpIJAGxdVqqdSk67Vao";

  static const book = "book";
  static const song = "song";
}

class EventConstants {
  static const int serverError = 3;
  static const int forbidden = 5;
  static const int requestSuccessful = 10;
  static const int requestUnsuccessful = 11;
  static const int requestNotFound = 12;
  static const int requestSuspended = 13;
  static const int requestUnpermited = 14;
  static const int requestInvalid = 15;
  static const int serviceUnavailable = 16;
  static const int preconditionFailed = 17;
  static const int invalidAccessToken = 18;

  static const int noInternetConnection = 20;

  static const int userSigninSuccessful = 500;
  static const int userSigninUnsuccessful = 501;
  static const int userNotFound = 502;
  static const int userSignupSuccessful = 503;
  static const int userSignupUnsuccessful = 504;
  static const int userAlreadyRegistered = 505;
  static const int signupSuspended = 506;
  static const int signupUnpermited = 507;
  static const int changePasswordSuccessful = 508;
  static const int changePasswordUnsuccessful = 509;
  static const int invalidOldPassword = 510;
}

class EventMessages {
  static const String serverError = 'Server Error';
  static const String forbidden = 'Request is forbidden';
  static const String requestSuccessful = 'Request was successful';
  static const String requestUnsuccessful = 'Request not successful';
  static const String requestNotFound = 'Request not found';
  static const String requestSuspended = 'Request was suspended';
  static const String requestUnpermited = 'Request is not permitted';
  static const String requestInvalid = 'Request is invalid';
  static const String serviceUnavailable = 'Service unavailable';
  static const String preconditionFailed = 'Pre condition failed';
  static const String invalidAccessToken = 'Invalid access token';

  static const String noInternetConnection = 'No internet connection';

  static const String userSigninSuccessful = 'Signin was Successful';
  static const String userSigninUnsuccessful = 'Signin Unsuccessful';
  static const String userNotFound = 'User not found';
  static const String userSignupSuccessful = 'Signing up was successful';
  static const String userSignupUnsuccessful = 'Signing up unsuccessful';
  static const String userAlreadyRegistered = 'You are already registered';
  static const String signupSuspended = 'Signing up is suspended';
  static const String signupUnpermited = 'Signing up is not permited';
  static const String changePasswordSuccessful =
      'Password change was successful';
  static const String changePasswordUnsuccessful =
      'Password change unsuccessful';
  static const String invalidOldPassword = 'Invalid Old Password';
}

class ApiResponseCode {
  static const int scOK = 200;
}
