import 'package:flutter/material.dart';
import 'package:mvvm/pages/start_page.dart';

import 'pages/login_page.dart';

///
class Routers {
  ///
  static const String LOGIN = 'login';

  ///
  static const String START = 'start';

  ///
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case START:
        return MaterialPageRoute(builder: (_) => StartPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('没有找到对应的页面：${settings.name}'),
                  ),
                ));
    }
  }
}
