// ignore_for_file: use_build_context_synchronously

import 'package:appwrite/appwrite.dart';
import 'package:flappwrite_water_tracker/app/pages/home_page.dart';
import 'package:flappwrite_water_tracker/app/pages/signup_page.dart';
import 'package:flappwrite_water_tracker/app/service/api_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailEC;
  late TextEditingController _passwordEC;

  @override
  void initState() {
    super.initState();
    _emailEC = TextEditingController();
    _passwordEC = TextEditingController();
  }

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Text(
              "Login",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 30.0),
            TextField(
              controller: _emailEC,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: "email",
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _passwordEC,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: "password",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  await ApiService.instance.login(
                    email: _emailEC.text,
                    password: _passwordEC.text,
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomePage(),
                    ),
                  );
                } on AppwriteException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.message ?? 'Unknown error'),
                    ),
                  );
                }
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SignupPage(),
                  ),
                );
              },
              child: const Text("Not registered? Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
