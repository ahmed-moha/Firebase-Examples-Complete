import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class GoogleScreen extends StatefulWidget {
  const GoogleScreen({Key? key}) : super(key: key);

  @override
  State<GoogleScreen> createState() => _GoogleScreenState();
}

class _GoogleScreenState extends State<GoogleScreen> {
  bool isLoading = false;
  final auth = FirebaseAuth.instance;
  google() async {
    isLoading = true;
    setState(() {});
    try {
      final googleSignIn = await GoogleSignIn().signIn();// Gmail-kaa uu kuu soo kicinaa
      final authen = await googleSignIn?.authentication; // idtoken iyo access token
      final credential = GoogleAuthProvider.credential(
          idToken: authen?.idToken, accessToken: authen?.accessToken); // credentiolka ayuu kuu abuuraa

     await auth.signInWithCredential(credential);
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
          title:  const Text("Google Screen"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.network(auth.currentUser?.photoURL??""),
              Text(auth.currentUser?.displayName??"",style: const TextStyle(
                fontSize: 50
              ),),
              ElevatedButton(
                onPressed: () {
                  google();
                },
                child: const Text("Sign in with google"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
