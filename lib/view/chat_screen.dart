import 'dart:io';

import 'package:chat_firebase/components/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  void _enviarMensagem({String texto, File imgFile}) async {

    if(imgFile != null) {
      await Firebase.initializeApp();
      FirebaseStorage storage = FirebaseStorage.instance;
      await storage.ref().child(
        DateTime.now().millisecondsSinceEpoch.toString()
      ).putFile(imgFile);
      String url = await storage.ref().getDownloadURL();
      print(url);
    }

    await Firebase.initializeApp();
    CollectionReference msg = FirebaseFirestore.instance.collection('mensagens');
    msg.add({'texto':texto});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('olá'),
        elevation: 0,
      ),
      body: TextComposer(_enviarMensagem),
    );
  }
}