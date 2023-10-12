import 'package:dio/dio.dart';

final dio = Dio();

class Services {
  static Future<Messages?> loginUser(
      {required String login, required String password}) async {
    try {
      var res = await dio.post(
          'https://api.abdullajonov.uz/banner-ads-backend/api/loginUser',
          data: {
            'login': login,
            'password': password,
          });
      return Messages(messages: res.data, isSuccess: true);
    } catch (e) {
      if (e is DioException) {
        print(e.response!.data['message']);
        return Messages(
            messages: e.response!.data['message'], isSuccess: false);
      }
      print(e);
    }
    return null;
  }

  static Future<Messages?> verify(
      {required String email, required String code}) async {
    try {
      var res = await dio.post(
          'https://api.abdullajonov.uz/banner-ads-backend/api/verify',
          data: {
            'email': email,
            'code': code,
          });
      return Messages(messages: res.data, isSuccess: true);
    } catch (e) {
      if (e is DioException) {
        print(e.response!.data.toString());
        return Messages(
            messages: e.response!.data['message'], isSuccess: false);
      }
    }
  }

  static Future<Messages?> register(RegisterUser user) async {
    try {
      print('Try ');
      final res = await dio.post(
          'https://api.abdullajonov.uz/banner-ads-backend/api/register',
          data: {
            'name': user.name,
            'login': user.login,
            'password': user.password,
            'email': user.email,
          });
      return Messages(messages: res.data, isSuccess: true);
    } catch (e) {
      print('Error ');
      if (e is DioException) {
        print('if: ${e.message}');
        print('if: ${e.response!.data}');

        return Messages(
            messages: e.response!.data['message'], isSuccess: false);
      }
    }
    return null;
  }

  static resend(String email) async {
    var res = await dio.post(
        'https://api.abdullajonov.uz/banner-ads-backend/api/resend',
        data: {'email': email});
    print(res);
  }
}



class Messages {
  String messages;
  bool isSuccess;
  Messages({
    required this.messages,
    required this.isSuccess,
  });
}

class RegisterUser {
  String name;
  String login;
  String password;
  String email;
  RegisterUser({
    required this.name,
    required this.login,
    required this.password,
    required this.email,
  });
}
