import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{

  

  runApp(MyApp());
  print('Executou');
  //Firestore.instance.collection("col").document("doc").setData({"texto":"daniel"});
  await Firebase.initializeApp();
  CollectionReference teste = FirebaseFirestore.instance.collection('col');
  DocumentReference doc = FirebaseFirestore.instance.collection('col').doc('msg2');
  //DocumentReference doc = FirebaseFirestore.instance.collection('col').doc('msg2').collection('arquivos').doc();
  /*doc.set({'doc': 'doc'}).then((valor) => print("criou o documento"))
  .catchError((error) => print("falha na conexão: $error"));
  print('Depois da conexao');*/
  /*doc.set({
    'texto':'Tudo bem?',
    'from':'Junior',
    'read':false
    }).then((valor) => print("Conexão estabelecida"))
  .catchError((error) => print("falha na conexão: $error"));*/
  /*doc.update({
    'read':true
    }).then((valor) => print("Conexão estabelecida"))
  .catchError((error) => print("falha na conexão: $error"));*/
  /*doc.set({
    'arqname':'foto.png'
    }).then((valor) => print("Conexão estabelecida"))
  .catchError((error) => print("falha na conexão: $error"));*/
  /*QuerySnapshot snapshot = await teste.get();
  snapshot.docs.forEach((d) {
    print('Entrou no foreach');
    print(d.data());
  });*/
  DocumentSnapshot snapshot = await doc.get();
  print(snapshot.data());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container()
    );
  }

  
}

