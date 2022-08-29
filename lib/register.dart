import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final auth = FirebaseAuth.instance;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  register() async {
    isLoading = true;
    setState(() {});

    try {
    var data=await  auth.createUserWithEmailAndPassword(
          email: username.text, password: password.text);

    print("SUCCESS");
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
          title: const Text("Register Screen"),
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
                    register();
                  },
                  child: const Text("SAVE"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
