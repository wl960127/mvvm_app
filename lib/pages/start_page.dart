import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/pages/common/base.dart';
import 'package:mvvm/viewmodel/start_provide.dart';

///
class StartPage extends PageProvideNode<StartProvide> {
  ///
  StartPage(String title) : super(params: [title]);

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    throw UnimplementedError();
  }
}
