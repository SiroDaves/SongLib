import 'package:http/http.dart';

import '../../widgets/general/toast.dart';
import '../app_util.dart';

class RequestHandler {
  Future<void> postRequestHandler(Future<Response> api, String successMessage,
      String errorMessage, Future<dynamic>? nextPageRoute) async {
    try {
      var response = await api;

      if (response.statusCode == 200) {
        showToast(text: successMessage, state: ToastStates.success);
        nextPageRoute;
      } else if (response.statusCode == 400) {
        showToast(
            text: 'We are sorry, we cannot find the requested resource.',
            state: ToastStates.error);
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        showToast(
            text:
                'Please make sure you have the required access rights before making the request',
            state: ToastStates.error);
      } else if (response.statusCode == 404) {
        showToast(
            text: 'We could not complete your request please retry again.',
            state: ToastStates.error);
      } else if (response.statusCode == 500) {
        showToast(
            text:
                'We aplogies for the system downtime, we are working to resolve it.',
            state: ToastStates.error);
      } else if (response.statusCode == 504) {
        showToast(
            text: 'The request took too long to respond, please retry again.',
            state: ToastStates.error);
      } else {
        showToast(text: response.body, state: ToastStates.error);
      }
    } catch (e) {
      logger(e.toString());
      showToast(text: errorMessage, state: ToastStates.error);
    }
  }

  Future<void> patchRequestHandler(Future<Response> api, String successMessage,
      String errorMessage, Future<dynamic>? nextPageRoute) async {
    try {
      var response = await api;

      if (response.statusCode == 202) {
        showToast(text: successMessage, state: ToastStates.success);
        nextPageRoute;
      } else if (response.statusCode == 400) {
        showToast(
            text: 'We are sorry, we cannot find the requested resource.',
            state: ToastStates.error);
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        showToast(
            text:
                'Please make sure you have the required access rights before making the request',
            state: ToastStates.error);
      } else if (response.statusCode == 404) {
        showToast(
            text: 'We could not complete your request please retry again.',
            state: ToastStates.error);
      } else if (response.statusCode == 500) {
        showToast(
            text:
                'We aplogies for the system downtime, we are working to resolve it.',
            state: ToastStates.error);
      } else if (response.statusCode == 504) {
        showToast(
            text: 'The request took too long to respond, please retry again.',
            state: ToastStates.error);
      } else {
        showToast(text: response.body, state: ToastStates.error);
      }
    } catch (e) {
      logger(e.toString());
      showToast(text: errorMessage, state: ToastStates.error);
    }
  }

  Future<void> createRequestHandler(Future<Response> api, String successMessage,
      String errorMessage, Future<dynamic>? nextPageRoute) async {
    try {
      var response = await api;

      if (response.statusCode == 201) {
        showToast(text: successMessage, state: ToastStates.success);
        await Future.delayed(const Duration(seconds: 3));
        nextPageRoute;
      } else if (response.statusCode == 400) {
        showToast(
            text: 'We are sorry, we cannot find the requested resource.',
            state: ToastStates.error);
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        showToast(
            text:
                'Please make sure you have the required access rights before making the request',
            state: ToastStates.error);
      } else if (response.statusCode == 404) {
        showToast(
            text: 'We could not complete your request please retry again.',
            state: ToastStates.error);
      } else if (response.statusCode == 500) {
        showToast(
            text:
                'We aplogies for the system downtime, we are working to resolve it.',
            state: ToastStates.error);
      } else if (response.statusCode == 504) {
        showToast(
            text: 'The request took too long to respond, please retry again.',
            state: ToastStates.error);
      } else {
        showToast(text: response.body, state: ToastStates.error);
      }
    } catch (e) {
      logger(e.toString());
      showToast(text: errorMessage, state: ToastStates.error);
    }
  }
}
