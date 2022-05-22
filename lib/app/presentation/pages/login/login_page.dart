import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/app/BloC/bloc/theme/theme_bloc.dart';
import 'package:uber_clone/app/data/theme_manager.dart';
import 'package:uber_clone/app/routes/route_name.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => context.read<ThemeBloc>().add(
                         const ChangeTheme(
                            themeMode: AppThemeMode.light,
                          ),
                        ),
                    child: const Text("Light Theme"),
                  ),
                  const SizedBox(width: 4),
                  ElevatedButton(
                    onPressed: () => context.read<ThemeBloc>().add(
                         const ChangeTheme(
                            themeMode:AppThemeMode.dark,
                          ),
                        ),
                    child: const Text("Dark Theme"),
                  ),
                  const SizedBox(width: 4),
                  ElevatedButton(
                    onPressed: () => context.read<ThemeBloc>().add(
                          const ChangeTheme(
                            themeMode: AppThemeMode.system,
                          ),
                        ),
                    child: const Text("System Theme"),
                  ),
                ],
              ),
            ),
            Text("LOGIN", style: Theme.of(context).textTheme.headline2),
            TextFormField(),
            const SizedBox(height: 20),
            TextFormField(),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => login(context), child: const Text("Login")),
            const SizedBox(height: 50),
            RichText(
              text: TextSpan(
                text: "Don't have an account? try \t\t",
                style:
                    Theme.of(context).textTheme.caption?.copyWith(fontSize: 15),
                children: [
                  TextSpan(
                    text: "Sign Up",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 18, color: Colors.blueAccent),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => signup(context),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  login(BuildContext context) {
    Navigator.pushNamed(context, RouteName.home);
  }

  signup(BuildContext context) {
    Navigator.pushNamed(context, RouteName.signup);
  }
}
