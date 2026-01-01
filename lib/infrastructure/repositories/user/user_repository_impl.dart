import 'package:dartz/dartz.dart';
import 'package:my_template/core/networks/error_handler.dart';
import 'package:my_template/domain/entities/user/user_entity.dart';
import 'package:my_template/domain/repositories/user/user_repository.dart';
import 'package:my_template/infrastructure/datasource/user/user_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;
  UserRepositoryImpl(this.userDataSource);
  @override
  Future<Either<Failure, List<UserEntity>>> getUsers(
          {Map<String, dynamic>? params}) =>
      userDataSource.getUsers(params: params);
}
