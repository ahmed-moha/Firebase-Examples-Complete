import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final auth = FirebaseAuth.instance;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  login() async {
    isLoading = true;
    setState(() {});
    try {
      await auth.signInWithEmailAndPassword(
          email: username.text, password: password.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("SUCCESS"),
        ),
      );
      username.clear();
      password.clear();
    } catch (e) {
      print(e);
    }
     isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title:  Text(auth.currentUser?.email??""),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: username,
                  decoration: const InputDecoration(
                      hintText: "Username", border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: password,
                  decoration: const InputDecoration(
                      hintText: "Username", border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: const Text("LOGIN"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
