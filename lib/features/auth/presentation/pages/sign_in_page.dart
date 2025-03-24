import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group414/core/route/route_names.dart';
import 'package:group414/features/auth/presentation/manager/auth_state.dart';
import '../../domain/entities/user_entity.dart';
import '../manager/auth_provider.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn({required UserEntity userEntity}) {
    ref.read(authNotifierProvider.notifier).signIn(userEntity: userEntity);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    // if (authState is AuthSuccess) {
    //   Navigator.pushNamed(context, RouteNames.homePage);
    // }
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next is AuthSuccess) {
        Navigator.pushReplacementNamed(context, RouteNames.homePage);
      } else if (next is AuthError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.message)));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in page"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Email"),
              controller: emailController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Password"),
              controller: passwordController,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                UserEntity userEntity = UserEntity(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
                signIn(userEntity: userEntity);
              },
              child: Text("Sign in"),
            ),
            if (authState is AuthLoading)
              Center(child: CircularProgressIndicator()),
            if (authState is AuthError) Text(authState.message),
          ],
        ),
      ),
    );
  }
}
