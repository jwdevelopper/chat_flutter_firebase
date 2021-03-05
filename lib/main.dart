import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{

  

  runApp(MyApp());
  print('Executou');
  //Firestore.instance.collection("col").document("doc").setData({"texto":"daniel"});
  await Firebase.initializeApp();
  CollectionReference teste = FirebaseFirestore.instance.collection('col');
  DocumentReference doc = FirebaseFirestore.instance.doc('doc');
  doc.set({'doc': 'doc'}).then((valor) => print("criou o documento"))
  .catchError((error) => print("falha na conexão: $error"));
  print('Depois da conexao');
  teste.add({'texto':'Junior'}).then((valor) => print("Conexão estabelecida"))
  .catchError((error) => print("falha na conexão: $error"));
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
      home: Scaffold()
    );
  }

  
}

