import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  TextComposer(this.sendMessage);

  final Function({String texto, File imgFile}) sendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _digitandoTexto = false;
  final TextEditingController _controller = TextEditingController();

  void _reset() {
    _controller.clear();
    setState(() {
      _digitandoTexto = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () async {
              final File imgFile = await ImagePicker.pickImage(source: ImageSource.camera);
              if(imgFile == null) return;
              widget.sendMessage(imgFile:imgFile);
            },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration:
                  InputDecoration.collapsed(hintText: 'Enviar uma mensagem'),
              onChanged: (texto) {
                setState(() {
                  _digitandoTexto = texto.isNotEmpty;
                });
              },
              onSubmitted: (texto) {
                widget.sendMessage(texto:texto);
                _reset();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _digitandoTexto
                ? () {
                    widget.sendMessage(texto:_controller.text);
                    _reset();
                  }
                : null,
          )
        ],
      ),
    );
  }
}
