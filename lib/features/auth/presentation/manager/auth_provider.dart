import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group414/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:group414/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:group414/features/auth/domain/use_cases/sign_In_usecase.dart';

import '../../domain/repositories/auth_repository.dart';
import 'auth_notifier.dart';
import 'auth_state.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(
    firebaseAuth: ref.watch(firebaseAuthProvider),
  );
});
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    authRemoteDataSource: ref.watch(authRemoteDataSourceProvider),
  );
});

final signInUseCaseProvider = Provider<SignInUsecase>((ref) {
  return SignInUsecase(authRepository: ref.watch(authRepositoryProvider));
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((
  ref,
) {
  return AuthNotifier(signInUsecase: ref.watch(signInUseCaseProvider));
});
