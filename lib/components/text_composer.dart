import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {

  bool _digitandoTexto = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: (){
               
            },
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: 'Enviar uma mensagem'),
              onChanged: (texto){
                setState(() {
                                  _digitandoTexto = texto.isNotEmpty;
                                });
              },
              onSubmitted: (texto){},
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _digitandoTexto ? (){} : null,
          )
        ],
      ),
    );
  }
}