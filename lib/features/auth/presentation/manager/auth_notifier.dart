import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/use_cases/sign_In_usecase.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final SignInUsecase signInUsecase;

  AuthNotifier({required this.signInUsecase}) : super(AuthInitial());

  Future<void> signIn({required UserEntity userEntity}) async {
    try {
      state = AuthLoading();
      final user = await signInUsecase.call(userEntity: userEntity);
      state = AuthSuccess(user);
    } catch (e, s) {
      state = AuthError(e.toString());
      print(e);
      print(s);
    }
  }
}
