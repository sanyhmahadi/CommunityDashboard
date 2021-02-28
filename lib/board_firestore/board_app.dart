import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BoardApp extends StatefulWidget {
  @override
  _BoardAppState createState() => _BoardAppState();
}

class _BoardAppState extends State<BoardApp> {
  var firestoreDb = FirebaseFirestore.instance.collection("board").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Commmunity Board App"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: firestoreDb,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data.docoments.length,
            itemBuilder: (context, int index) {
              return Text(snapshot.data.docomnets[index]['title']);
            },
          );
        },
      ),
    );
  }
}
