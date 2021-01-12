import 'package:mvvm/data/entity/login_entity.dart';
import 'package:mvvm/di/net/dio_manager.dart';
import 'package:mvvm/di/net/request_method.dart';

///
class LoginService {
  ///
  Future login() =>
      DioManager().request<LoginEntity>(RequestMethod.GET, "login");
}

/// 登录接口
///
class LoginRepository {
  final LoginService _loginService;

  ///
  LoginRepository(this._loginService);

  ///
  Future login(String username, String password) {
    return _loginService.login();
  }
}
