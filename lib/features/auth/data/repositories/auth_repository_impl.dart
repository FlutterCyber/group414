import 'package:firebase_auth/firebase_auth.dart';
import 'package:group414/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:group414/features/auth/domain/repositories/auth_repository.dart';

import '../../domain/entities/user_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<User?> signUp({required UserEntity userEntity}) {
    return authRemoteDataSource.signIn(userEntity: userEntity);
  }
}
