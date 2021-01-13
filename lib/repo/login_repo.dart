import 'package:mvvm/di/net/dio_manager.dart';
import 'package:rxdart/rxdart.dart';

///
class LoginService {
  ///
  Future _get(String url, {Map<String, dynamic> params}) async {
    var response = await DioManager().dio.get(url, queryParameters: params);
    return response.data;
  }

  ///
  Observable login(String url, {Map<String, dynamic> params}) =>
      Observable.fromFuture(_get(url, params: params)).asBroadcastStream();

  // Observable post(String url, Map<String, dynamic> params) =>
  //     Observable.fromFuture(_post(url, params)).asBroadcastStream();
  //
  // Observable get(String url, {Map<String, dynamic> params}) =>
  //     Observable.fromFuture(_get(url, params: params)).asBroadcastStream();
  //
  // Future _post(String url, Map<String, dynamic> params) async {
  //   var response = await dio.post(url, data: params);
  //   return response.data;
  // }
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

  Observable login(String username, String password) {
    return _loginService.login("");
  }
}
