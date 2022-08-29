import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUsersScreen extends StatelessWidget {
  GetUsersScreen({Key? key}) : super(key: key);

  final myStream =
      FirebaseFirestore.instance.collection("customer").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Get Users Screen"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: myStream,
        builder: (context, snap) {
          if (snap.hasData) {
            var data = snap.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) =>  ListTile(
                title: Text(data[index]["name"]),
                subtitle: Text(data[index]["address"]),
              ),
            );
          } else if (snap.hasError) {
            return const Text("ERROR");
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
