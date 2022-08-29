import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final firestore = FirebaseFirestore.instance;
  bool isLoading = false;
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  saveUser() async {
    isLoading = true;
    setState(() {});
    try {
      await firestore.collection("customer").add({
        "name":name.text,
        "phone":phone.text,
        "address":address.text,

      });

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
          title: const Text("Add User Screen"),
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
                  controller: name,
                  decoration: const InputDecoration(
                      hintText: "Name", border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: phone,
                  decoration: const InputDecoration(
                      hintText: "Phone", border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: address,
                  decoration: const InputDecoration(
                      hintText: "Address", border: OutlineInputBorder()),
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
                    saveUser();
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
