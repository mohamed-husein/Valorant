import 'package:get_it/get_it.dart';

import '../../features/business/agents/agents_cubit.dart';
import '../../features/business/home/home_cubit.dart';
import '../../features/data/repository/repository.dart';
import '../../features/data/web_services/web_services.dart';

final GetIt sl = GetIt.instance;

class DependencyInjectionServices {
  static init() {
    // *** Web Sercices
    sl.registerLazySingleton<WebServices>(() => WebServices());

    // *** Repository
    sl.registerLazySingleton<Repository>(() => Repository(webServices: sl()));

    // *** Cubit
    sl.registerFactory<AgentsCubit>(() => AgentsCubit(repository: sl()));
    sl.registerFactory<HomeCubit>(() => HomeCubit());
  }
}
