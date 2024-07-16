import 'dart:developer';

import 'package:googleapis_auth/auth_io.dart';

class NotificationAccessToken {
  static String? _token;

  //to generate token only once for an app run
  static Future<String?> get getToken async => _token ?? await _getAccessToken();

  // to get admin bearer token
  static Future<String?> _getAccessToken() async {
    try {
      const fMessagingScope =
          'https://www.googleapis.com/auth/firebase.messaging';

      final client = await clientViaServiceAccount(
        // To get Admin Json File: Go to Firebase > Project Settings > Service Accounts
        // > Click on 'Generate new private key' Btn & Json file will be downloaded

        // Paste Your Generated Json File Content
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
  "project_id": "chatingapp-42fb4",
  "private_key_id": "7866b64ee2a684bd4e127d03929df5993fb30b75",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCi76eRk+xjUsOp\nHpCwtlC1cgkwrHa1enIn1nll4DvFMIs7uIa0Lj0pXhCGU1WSt7uppUl9Kq/OJHoz\n3SW7F7ZAVA1PRkmrUnyFlVusWojEoBqvM8QyJy7gakOEJzIGHZDVkhMYNUa9rFDw\no4hg9eE7xb2ncKjqWeV6IYcbp7Zz8kB+uJBL9PT42LOQic4WpjIEvif9I2m3sco4\nENyUZqgn8Z8Pzad9C5XLQKhoh2vYO0IVOVJgs5gGNdbHxiCDJOqKDeW5mJzFH7yY\ni3ly/bPpxe2cEzwccf7d55Yb8Wb7Do7T9Hm4qIt9pwSgD3Cigwz4JcJgKYYiYNax\nalBitECXAgMBAAECggEAE1f5YF6b51TJltfinKAgZ9Iwhh9LfpMZX2JmijI7VldD\niGUJVPXSXAlnU9Mr6x22AVd2qI37TjFlcqfUFWikwfFYnSs+jsDduKw5NHaRGyrY\n0CkIp12ggpMLDfLrTO+QpNJRQwP8MIN3HoKDq+M1CLgaonjNDPl8NWoqlJ1uG0ic\nSs9H1dNDzFgtZgnRC4lJCV0nObx7wKOV0yrZEg31XyfmYdAaXFbbNWJvnKWOSdKK\n+3TKo03bUvCQx9JhADGj5rAG2r0GEiNy2N2dkH5TPE4zgEzOZMGiUYPecNmRuAfF\n+V/lojijgi2gMzDRkRkQsPsg1z+WYtvvMljR2dALTQKBgQDZJXM3Zcxt43eiTow6\nBaf+CxTfgSDq6bCmrXTsSJd6KcazyY3rXZCvaUEk6JvH8bT+JsRvILzjPeyq1poT\nux5iL+ccA/l3SRcqMQTHcvHoQ592x7tbnfc0Dse+meF1UZpxUXs8L9iaEDo4DXZT\nomiCV2j3y+qWrOIOkuVrNQgiTQKBgQDAFxFwOUA/GuhbCP7w7D8E4u+HEbGriDCr\nBtgklPOBugRfSFa6afb9vGCTs5ruj5We9P7HtQP2N1pOhs8BuT9eePvZMqwy2qlE\n/YPAuHhAf7jOPFKGG6v2g/fiA2cZ5hPCZaN4hnNlf3v0cL2T2ROfVrIakdzdP8El\nD27C+Lw4cwKBgAFmy3qVDp+68x+6EA+jz7TFD4ptw++gOIKq5fFMeqXQNTcd2uuk\n+/UV4dTCJ5c/ySJGz8fD11REJw3nOrFb6NNLadt1bxvE/gBItrYu2L7eCN50ZZIu\nz9SnL8TcK2ddcni+xOPbjzNXXXjVJWlex/vnYocO6uG0FfVwH0j026uVAoGBALnn\n2X22OuKYJRat7ya2Tgtpoo4jZsNvTELJnfhRnBYKNN8OgLlrgppxbTqlkaWemxy7\nWbVoEEyDp8fmGoQ9iAHjr0K3EwcorrfRb2jeX6t0sSQQJ4IZV+V+NTKtPmRHUwpK\nGdq0rQwnRIz/a8qiRaZpXnfugUYzxLccZ4MU/fzXAoGAcFkLVk1tVfn7fAd9s8PQ\nE68/nSs6rkqwTE/Ot8FkO2nCAXzNKVJLHoMk+rlK+J8LKY+/i2Ah3quoo/awSYe7\n7NrYvkQj6Ar93oz6jZ4B6szmxbXVHmD00gnQWr4PbvK7n9pehVwF3wiVEXz9UbQE\nT/ch64+6sfRKIabo/Ot0/yI=\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-dym3o@chatingapp-42fb4.iam.gserviceaccount.com",
  "client_id": "105476829342600791327",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-dym3o%40chatingapp-42fb4.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
        }),
        [fMessagingScope],
      );

      _token = client.credentials.accessToken.data;

      return _token;
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
