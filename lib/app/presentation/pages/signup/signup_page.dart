import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/app/routes/route_name.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Sign Up", style: Theme.of(context).textTheme.headline2),
            TextFormField(),
            const SizedBox(height: 20),
            TextFormField(),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => signup(context), child: const Text("Login")),
            const SizedBox(height: 50),
            RichText(
              text: TextSpan(
                text: "Have an account? try \t\t",
                style:
                    Theme.of(context).textTheme.caption?.copyWith(fontSize: 15),
                children: [
                  TextSpan(
                    text: "Log In",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 18, color: Colors.blueAccent),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => login(context),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.indigo)
                    ),
                    child: IconButton(
                      onPressed: () => googleAuth(),
                      icon: Text(
                        "G",
                        style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 30),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.indigo)
                    ),
                    child: IconButton(
                      onPressed: () => phoneAuth(context),
                      icon: const Icon(Icons.phone, size: 30, color: Colors.black38,),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  login(BuildContext context) {
    Navigator.pushNamed(context, RouteName.login);
  }

  signup(BuildContext context) {
    Navigator.pushNamed(context, RouteName.home);
  }

  googleAuth() {}

  phoneAuth(BuildContext context) {
    Navigator.pushNamed(context, RouteName.phoneAuth);
  }
}
