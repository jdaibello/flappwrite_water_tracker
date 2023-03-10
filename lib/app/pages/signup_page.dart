// ignore_for_file: use_build_context_synchronously

import 'package:appwrite/appwrite.dart';
import 'package:flappwrite_water_tracker/app/service/api_service.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late TextEditingController _emailEC;
  late TextEditingController _passwordEC;
  late TextEditingController _nameEC;

  @override
  void initState() {
    super.initState();
    _emailEC = TextEditingController();
    _passwordEC = TextEditingController();
    _nameEC = TextEditingController();
  }

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _nameEC.dispose();
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
            const SizedBox(height: 10.0),
            TextField(
              controller: _nameEC,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: "name",
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _emailEC,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: "email",
              ),
            ),
            const SizedBox(height: 20.0),
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
                  await ApiService.instance.signUp(
                    email: _emailEC.text,
                    password: _passwordEC.text,
                    name: _nameEC.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Sign up successfully. Login to access your account',
                      ),
                    ),
                  );
                  Navigator.pop(context);
                } on AppwriteException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.message ?? 'Unknown error'),
                    ),
                  );
                }
              },
              child: const Text("Signup"),
            ),
            const SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Already registered? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
