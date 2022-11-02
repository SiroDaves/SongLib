class ApiConstants {
  static const parseUrl = "https://parseapi.back4app.com/classes/";
  static const parseAppID = "vuzJgKGqPqx7HUhx2dgjokgZinPUppmygSOfYBSg";
  static const parseApiKey = "9s9zQYmaNMGf9BXWRfuWmgpIJAGxdVqqdSk67Vao";

  static const book = "Book";
  static const edit = "Edit";
  static const notification = "Notification";
  static const song = "Song";
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
