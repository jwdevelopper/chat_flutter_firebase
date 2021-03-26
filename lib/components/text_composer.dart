import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  TextComposer(this.sendMessage);

  final Function(String? texto, File? imgFile) sendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _digitandoTexto = false;

  File? _imagem;
  final picker = ImagePicker();
  final TextEditingController _controller = TextEditingController();

  void _reset() {
    _controller.clear();
    setState(() {
      _digitandoTexto = false;
    });
  }

  Future getImagem() async {
    print('CHamou o metodo');
    final imagemEscolhida = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (imagemEscolhida != null) {
        _imagem = File(imagemEscolhida.path);
        widget.sendMessage(null,_imagem);
      }
    });
    /*http://127.0.0.1:63373/D:/Cursos/flutter/chat_firebase/lib/components/text_composer.dart?authToken=PtBwLCXQ5zI%3D */
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: getImagem,
            tooltip: 'Selecione a Imagem',
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
                widget.sendMessage(texto,null);
                _reset();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _digitandoTexto
                ? () {
                    widget.sendMessage(_controller.text,null);
                    _reset();
                  }
                : null,
          )
        ],
      ),
    );
  }
}
