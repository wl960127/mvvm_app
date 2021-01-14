import 'package:dartin/dartin.dart';
import 'package:mvvm/repo/login_repo.dart';
import 'package:mvvm/viewmodel/login_provide.dart';
import 'package:mvvm/viewmodel/start_provide.dart';
import 'package:sp_util/sp_util.dart';

///
const mainScope = DartInScope('test');

/// 定义ViewModel模块
final viewModelModule = Module([
  factory<LoginProvider>(
      ({params}) => LoginProvider(params.get(0) as String, get())),
  factory<StartProvide>(({params}) => StartProvide())
])
  ..withScope(mainScope, []);

/// 定义Repository模块
final repositoryModule =
    Module([factory<LoginRepository>(({params}) => LoginRepository(get()))]);

/// 定义网络接口模块
final netModule = Module([
  factory<LoginService>(({params}) => LoginService()),
]);

/// 定义数据存储模块
final storeModule = Module([
  single<SpUtil>(({params}) => spUtil),
]);

///  模块集合
final appModule = [viewModelModule, repositoryModule, netModule, storeModule];

/// sp
SpUtil spUtil;

///初始化
init() async {
  spUtil = await SpUtil.getInstance();
  startDartIn(appModule);
}
