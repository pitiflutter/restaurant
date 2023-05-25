import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:restaurant/data/common/response_validator.dart';
import 'package:restaurant/data/model/auth_info.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant/util/const.dart';

abstract class IAuthDataSource {
  Future<AuthInfo> login(String email, String password);
  Future<AuthInfo> register(String firstName, String lastName, String email,
      String password, String phone);
  Future<AuthInfo> refereshToken(String token);
}

class AuthRemoteDataSource
    with HttpResponseValidator
    implements IAuthDataSource {
  final http.Client httpClient;

  AuthRemoteDataSource(this.httpClient);

  @override
  Future<AuthInfo> login(String email, String password) async {
    final Response response = await httpClient.post(
      Uri.parse("${Constants.url}/users/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'Email': email, 'password': password}),
    );
    ValidateResponse(response);
    Map result = jsonDecode(response.body);
    print(result["token"]);
    return AuthInfo( accessToken: result["token"], refreshToken: result["refresh_token"]);
  }

  @override
  Future<AuthInfo> refereshToken(String token) {
    // TODO: implement refereshToken
    throw UnimplementedError();
  }

  @override
  Future<AuthInfo> register(String firstName, String lastName, String email,
      String password, String phone) async {
    final Response response = await httpClient.post(
      Uri.parse("${Constants.url}/users/signup"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'First_name': email,
        "Last_name": lastName,
        "Password": password,
        "Email": email,
        "phone": phone
      }),
    );
    ValidateResponse(response);
    Map result = jsonDecode(response.body);
     return login(email, password);
  }
}
