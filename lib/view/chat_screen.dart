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


  /*@override
    void initState() {
      super.initState();
      Firebase.initializeApp();
    }*/

  void _enviarMensagem(String? texto, File? imgFile) async {
    await Firebase.initializeApp();

    Map<String, dynamic> data = {};

    if(imgFile != null) {
      String nomeArq = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseStorage storage = FirebaseStorage.instance;
      await storage.ref().child(
        nomeArq
      ).putFile(imgFile);
      print('Antes da url de download');
      String url = await storage.ref(nomeArq).getDownloadURL();
      //print("TESTE | " + teste);
      print("URL para download ver se printa no console: " + url);
      data['imgUrl'] = url;
    }
    if(texto != null){
      data['texto'] = texto;
    }
    CollectionReference msg = FirebaseFirestore.instance.collection('mensagens');
    msg.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('olá'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              
              stream: FirebaseFirestore.instance.collection('mensagens').snapshots(),
              builder: (context, snapshot){
                switch(snapshot.connectionState){
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    List<QueryDocumentSnapshot> documentos = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: documentos.length,
                      reverse: false,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: Text(documentos[index].get('texto')),
                        );
                      }
                      );
                }
              },
            ),
            ),
          TextComposer(_enviarMensagem),
        ],
      ),
    );
  }
}