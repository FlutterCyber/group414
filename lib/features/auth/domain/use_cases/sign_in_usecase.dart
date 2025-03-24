import 'package:firebase_auth/firebase_auth.dart';
import 'package:group414/features/auth/domain/repositories/auth_repository.dart';

import '../entities/user_entity.dart';

class SignInUsecase {
  AuthRepository authRepository;

  SignInUsecase({required this.authRepository});

  Future<User?> call({required UserEntity userEntity}) {
    return authRepository.signUp(userEntity: userEntity);
  }
}
