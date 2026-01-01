import 'package:my_template/infrastructure/datasource/user/user_datasource.dart';
import 'package:my_template/infrastructure/repositories/user/user_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:my_template/core/networks/api_client.dart';
import 'package:my_template/utils/flavor/flavor_utils.dart';
import 'package:my_template/infrastructure/datasource/auth/auth_local_datasource.dart';
import 'package:my_template/infrastructure/datasource/auth/auth_remote_datasource.dart';
import 'package:my_template/infrastructure/repositories/auth/auth_repository_impl.dart';
import 'package:my_template/routing/route.dart';

GetIt inject = GetIt.instance;

Future<void> setupInjector() async {
  /// Route
  inject.registerSingleton<AppRouter>(AppRouter());

  /// Registering flavors
  inject.registerSingleton(FlavorUtils()..initType());

  /// Reinitialize flavor
  await flavor.initType();

  /// Core api client
  inject.registerLazySingleton(() => ApiClient());

  /// Registering data source
  inject.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(),
  );
  inject.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(inject<ApiClient>()),
  );
  inject.registerLazySingleton<UserDataSource>(
    () => UserDataSource(inject<ApiClient>()),
  );

  /// Register bloc
  // inject.registerLazySingleton<PageBloc>(() => PageBloc()..initPage());

  /// Register repository
  inject.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(
      remoteDataSource: inject<AuthRemoteDataSource>(),
      localDataSource: inject<AuthLocalDataSource>(),
    ),
  );
  inject.registerLazySingleton<UserRepositoryImpl>(
    () => UserRepositoryImpl(
      inject<UserDataSource>(),
    ),
  );
}
