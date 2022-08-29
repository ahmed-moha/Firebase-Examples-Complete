import 'package:fire_app/add_user.dart';
import 'package:fire_app/get_user.dart';
import 'package:fire_app/google.dart';
import 'package:fire_app/register.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: const Text("Login"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
              child: const Text("Register"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddUserScreen(),
                  ),
                );
              },
              child: const Text("Save User"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  GetUsersScreen(),
                  ),
                );
              },
              child: const Text("Get Users"),
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  const GoogleScreen(),
                  ),
                );
              },
              child: const Text("Google Sign in"),
            ),
          ],
        ),
      ),
    );
  }
}
