import 'package:get_it/get_it.dart';
import 'package:your_notes/config/route/go_router_provider.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<GoRouterProvider>(GoRouterProvider());
}