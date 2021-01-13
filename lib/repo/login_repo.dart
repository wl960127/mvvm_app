import 'package:mvvm/di/net/dio_manager.dart';
import 'package:mvvm/di/net/request_method.dart';

///
class LoginService {
  ///
  Future login<T>({Map<String, dynamic> params}) async =>
      await DioManager().request<T>(RequestMethod.GET, "login");
}

/// 登录接口
///
class LoginRepository {
  final LoginService _loginService;

  ///
  LoginRepository(this._loginService);

  ///
  // Future<BaseEntity> login(String username, String password) {
  //   return _loginService.login();
  // }

  Future login<T>(String username, String password) {
    return _loginService.login<T>();
    // LoginEntity entity;

    // _loginService.login<LoginEntity>().then((value) {
    //   entity = value.reponseData as LoginEntity;
    //   return entity;
    //   // LoginEntity().fromJson(value.data as Map<String, String>)
    //   // LoginEntity().fromJson(value.data as Map<String, String>)
    // });
  }
}
