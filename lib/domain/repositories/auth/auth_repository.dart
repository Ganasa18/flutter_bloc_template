import 'package:dartz/dartz.dart';
import 'package:my_template/core/networks/error_handler.dart';
import 'package:my_template/domain/entities/auth/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> login(String username, String password);
  Future<void> saveAuth(AuthEntity auth);
  Future<bool> getSession();
  Future<String?> getToken();
  Future<bool> isAuth();
}
