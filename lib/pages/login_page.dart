import 'package:flutter/material.dart';
import 'package:mvvm/di/net/result_code.dart';
import 'package:mvvm/viewmodel/login_provide.dart';
import 'package:mvvm/widgets/toast.dart';
import 'package:provider/provider.dart';

import 'common/base.dart';

///
class LoginPage extends PageProvideNode<LoginProvider> {
  ///
  // LoginPage();

  LoginPage() : super();

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
          title: Text("login"),
        ),
        body: Center(
          child: Selector<LoginProvider, String>(
            selector: (_, data) => data.mResponse,
            builder: (context, value, child) {
              print("page  Selector");
              return Text(value);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            onClick("login");
          },
        ),
      ),
    );
  }

  /// 登录
  ///
  /// 调用 [mProvide] 的 login 方法并进行订阅
  /// 请求开始时：启动动画 [AnimationStatus.forward]
  /// 请求结束时：反转动画 [AnimationStatus.reverse]
  /// 成功 ：弹出 'login success'
  /// 失败 ：[dispatchFailure] 显示错误原因
  void login() {
    final s = provider.login().doOnListen(() {
      print("page 请求开始");
    }).doOnDone(() {
      print("page 请求结束");
    }).listen((value) {
      print("page 请求结果 $value");
      Toast.show("login success", context, type: Toast.SUCCESS);
    }, onError: (e) {
      print("page 请求异常 ${e.toString()}");
      dispatchFailure(context, e);
    });
    provider.addSubscription(s);
  }
}
