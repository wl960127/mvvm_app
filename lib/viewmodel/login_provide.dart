import 'package:mvvm/data/entity/login_entity.dart';
import 'package:mvvm/pages/common/base.dart';
import 'package:mvvm/repo/login_repo.dart';

///
class LoginProvider extends BaseProvide {
  String username = "姓名";
  String password = "密码";

  final String title;
  final LoginRepository _loginRepo;

  ///
  LoginProvider(this.title, this._loginRepo);

  ///
  Future login() => _loginRepo.login<LoginEntity>(username, password);
}
