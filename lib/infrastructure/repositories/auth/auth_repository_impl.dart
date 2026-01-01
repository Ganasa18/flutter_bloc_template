import 'package:dartz/dartz.dart';
import 'package:my_template/core/networks/error_handler.dart';
import 'package:my_template/infrastructure/datasource/auth/auth_local_datasource.dart';
import 'package:my_template/infrastructure/datasource/auth/auth_remote_datasource.dart';
import 'package:my_template/domain/entities/auth/auth_entity.dart';
import 'package:my_template/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, AuthEntity>> login(
      String username, String password) async {
    final auth = await remoteDataSource.login(username, password);
    auth.fold((left) {}, (right) async {
      saveAuth(right);
    });
    return auth;
  }

  @override
  Future<void> saveAuth(AuthEntity auth) => localDataSource.saveAuth(auth);

  @override
  Future<String?> getToken() => localDataSource.getAuth();

  @override
  Future<bool> isAuth() => localDataSource.isAuth();

  @override
  Future<bool> getSession() => localDataSource.getSession();
}
