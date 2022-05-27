import 'package:kiwi/kiwi.dart';
import '../Utilities/customeDialogs.dart';
import '../app/data/network_connectivity.dart';

part "app_module.g.dart";

abstract class AppModule {
  @Register.singleton(ConnectivityService)
  @Register.singleton(CustomDialogs)
  void configure();
}

void setup() {
  var appModule = _$AppModule();
  appModule.configure();
}
