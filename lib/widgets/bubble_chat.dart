

import 'package:flutter/material.dart';
import 'package:scholar_chat_app/models/messages_model.dart';

import '../constants.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({Key? key,required this.messagesModel}) : super(key: key);
  MessagesModel messagesModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 16 , right: 16 , top: 16 , bottom: 16),
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: kPrimaryColor,
        ),
        child:  Text( messagesModel.message,

          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
class ChatBubbleForAnther extends StatelessWidget {
  ChatBubbleForAnther({Key? key,required this.messagesModel}) : super(key: key);
  MessagesModel messagesModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: 16 , right: 16 , top: 16 , bottom: 16),
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Color(0xff006D84),
        ),
        child:  Text( messagesModel.message,

          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
