// ignore_for_file: depend_on_referenced_packages
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:therapy/core/utils/service_locator.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureInjection() => sl.init();

Future<void> restart() async {
  if (sl.currentScopeName == null) return;
  await sl.resetScope();
  configureInjection();
}
