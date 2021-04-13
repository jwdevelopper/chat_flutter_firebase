import 'package:flutter/material.dart';

class MensagensChat extends StatelessWidget {
  MensagensChat(this.data, this.mine);

  late final Map<String, dynamic> data;
  late final bool mine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          !mine ?
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(data['senderPhotoUrl']),
            ),
          ) : Container(

          ),
          Expanded(
              child: Column(
                crossAxisAlignment: mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              data['imgUrl'] != null
                  ? Image.network(data['imgUrl'], width: 250,)
                  : Text(
                      data['texto'],
                      textAlign: mine ? TextAlign.end : TextAlign.start,
                      style: TextStyle(fontSize: 16),
                    ),
              Text(
                data['senderName'],
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              )
            ],
          )),
          mine ?
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(data['senderPhotoUrl']),
            ),
          ) : Container(
            
          ),
        ],
      ),
    );
  }
}
