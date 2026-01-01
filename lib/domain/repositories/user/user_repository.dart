import 'package:dartz/dartz.dart';
import 'package:my_template/core/networks/error_handler.dart';
import 'package:my_template/domain/entities/user/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers(
      {Map<String, dynamic>? params});
}
