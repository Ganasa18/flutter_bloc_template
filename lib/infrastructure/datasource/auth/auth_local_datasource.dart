import 'dart:convert';

import 'package:my_template/utils/manager/shared_manager.dart';
import 'package:my_template/domain/entities/auth/auth_entity.dart';

class AuthLocalDataSource {
  Future<void> saveAuth(AuthEntity auth) async {
    final shared = SharedManager<String>();
    await shared.store("auth_data", jsonEncode(auth.toJson()));
    await shared.store("token_my_template", auth.accessToken);
    setSession(true);
  }

  Future<void> setSession(bool value) async {
    final shared = SharedManager<bool>();
    await shared.store("islogin", value);
  }

  Future<String?> getAuth() async {
    final shared = SharedManager<String>();
    String? token = await shared.read("token_my_template");
    return token;
  }

  Future<bool> getSession() async {
    final shared = SharedManager<bool>();
    bool? isLogin = await shared.read("islogin");
    return isLogin ?? false;
  }

  Future<bool> isAuth() async {
    final shared = SharedManager<bool>();
    bool? isLogin = await shared.read("islogin");
    return isLogin ?? false;
  }

  Future<void> removeAuth() async {
    final shared = SharedManager<String>();
    await shared.delete("auth_data");
    await shared.delete("token");
    setSession(false);
  }
}
