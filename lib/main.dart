import 'package:flutter/material.dart';
import 'package:mvvm/pages/login_page.dart';
import 'package:mvvm/router.dart';
import 'package:provider/provider.dart';

import 'di/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

///
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: MyRouter().registerRouter(),
      home: LoginPage("app"),
    );
  }
}
