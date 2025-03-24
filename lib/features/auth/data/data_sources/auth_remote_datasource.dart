import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<User?> signIn({required UserEntity userEntity});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<User?> signIn({required UserEntity userEntity}) async {
    var authResult = await firebaseAuth.createUserWithEmailAndPassword(
      email: userEntity.email,
      password: userEntity.password,
    );
    User? user = authResult.user;
    return user;
  }
}
