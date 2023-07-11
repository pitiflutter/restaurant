import 'package:flutter/foundation.dart';
import 'package:restaurant/data/common/http_client.dart';
import 'package:restaurant/data/source/auth_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth_info.dart';

final authRepository = AuthRepository(AuthRemoteDataSource(
  httpClient,
));

abstract class IAuthRepository {
  Future<void> login(String email, String pass);
  Future<void> register(String firstName, String lastName, String email,
      String password, String phone);
}

class AuthRepository implements IAuthRepository {
  static final ValueNotifier<AuthInfo?> authChangeNotifier = ValueNotifier(null);
   final IAuthDataSource authDataSource;

  AuthRepository(this.authDataSource,);
  @override
  Future<void> login(String email, String pass) async {
    AuthInfo authInfo = await authDataSource.login(email, pass);
    _persistToken(authInfo);
  }

  @override
  Future<void> register(String firstName, String lastName, String email,
      String password, String phone) async {
    AuthInfo authInfo = await authDataSource.register(
        firstName, lastName, email, password, phone);
    _persistToken(authInfo);
  }

  Future<void> _persistToken(AuthInfo authInfo) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("access_token", authInfo.accessToken);
    sharedPreferences.setString("refresh_token", authInfo.refreshToken);
  }

  Future<void> loadAuthInfo() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String accessToken =
        sharedPreferences.getString("access_token") ?? "";
    final String refreshToken =
        sharedPreferences.getString("refresh_token") ?? "";
    if(accessToken.isNotEmpty && refreshToken.isNotEmpty){
      authChangeNotifier.value =
        AuthInfo(accessToken: accessToken, refreshToken: refreshToken);
    }
  }
}
