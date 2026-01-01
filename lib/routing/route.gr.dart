// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:my_template/presentation/auth/auth_create_pin_screen.dart'
    as _i1;
import 'package:my_template/presentation/auth/auth_screen.dart' as _i2;
import 'package:my_template/presentation/auth/create_vault_screen.dart' as _i3;
import 'package:my_template/presentation/home/home_screen.dart' as _i4;
import 'package:my_template/presentation/splash/splash_screen.dart' as _i5;

/// generated route for
/// [_i1.AuthCreatePinScreen]
class AuthCreatePinRoute extends _i6.PageRouteInfo<void> {
  const AuthCreatePinRoute({List<_i6.PageRouteInfo>? children})
      : super(AuthCreatePinRoute.name, initialChildren: children);

  static const String name = 'AuthCreatePinRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthCreatePinScreen();
    },
  );
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i6.PageRouteInfo<void> {
  const AuthRoute({List<_i6.PageRouteInfo>? children})
      : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthScreen();
    },
  );
}

/// generated route for
/// [_i3.CreateVaultScreen]
class CreateVaultRoute extends _i6.PageRouteInfo<void> {
  const CreateVaultRoute({List<_i6.PageRouteInfo>? children})
      : super(CreateVaultRoute.name, initialChildren: children);

  static const String name = 'CreateVaultRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.CreateVaultScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}
