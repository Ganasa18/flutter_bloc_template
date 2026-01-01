import 'package:my_template/core/networks/api_client.dart';
import 'package:my_template/domain/entities/user/user_entity.dart';
import 'package:my_template/infrastructure/datasource/base/api_datasource.dart';
import 'package:my_template/domain/entities/auth/auth_entity.dart';

extension APIExtension on ApiClient {
  /// AUTH ENTITY
  ApiDataSource<AuthEntity> get auth =>
      ApiDataSource<AuthEntity>(this, AuthEntity.fromJson);

  /// USER ENTITY
  ApiDataSource<UserEntity> get user =>
      ApiDataSource<UserEntity>(this, UserEntity.fromJson);
}
