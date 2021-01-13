import 'package:flutter/material.dart';
import 'package:mvvm/viewmodel/login_provide.dart';

import 'common/base.dart';

///
class LoginPage extends PageProvideNode<LoginProvider> {
  ///
  LoginPage(String title) : super(params: [title]);

  @override
  Widget buildContent(BuildContext context) {
    return _LoginContentPage(mProvider);
  }
}

class _LoginContentPage extends StatefulWidget {
  final LoginProvider provider;

  _LoginContentPage(this.provider);

  @override
  __LoginContentPageState createState() => __LoginContentPageState();
}

///
class __LoginContentPageState extends State<_LoginContentPage>
    with TickerProviderStateMixin<_LoginContentPage>
    implements Presenter {
  LoginProvider provider;

  @override
  void initState() {
    super.initState();
    provider = widget.provider;
  }

  @override
  void onClick(String action) {
    switch (action) {
      case "login":
        login();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(provider.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            onClick("login");
          },
        ),
      ),
    );
  }

  void login() {
    provider.login().then((value) {
      print("action page 登录界面 用户：${value} 登陆成功");
    });
    // provider.addSubscription(subscription)
  }
}
