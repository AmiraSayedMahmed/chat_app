import 'package:flutter/material.dart';
import 'package:scholar_chat_app/constants.dart';
import 'package:scholar_chat_app/models/messages_model.dart';
import 'package:scholar_chat_app/widgets/bubble_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static String id = 'chatScreen';
  @override
  Widget build(BuildContext context) {
    var userEmail = ModalRoute.of(context)!.settings.arguments;
    final scrollController = ScrollController();
    CollectionReference messages = FirebaseFirestore.instance.collection(kMessageCollection);
    TextEditingController controller = TextEditingController();
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt,descending: true).snapshots(),
        builder: (context , snapshot) {
          if(snapshot.hasData) {
            List messageList = [];
            for(int i=0 ; i < snapshot.data!.docs.length ; i++){
              messageList.add(MessagesModel.fromJson(snapshot.data!.docs[i] ));
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kPrimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/scholar.png',
                      height: 50,
                    ),
                    const Text(
                      'Chats',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Pacifico'),
                    )
                  ],
                ),
              ),
              body: Column(
                  children: [
                  Expanded(
                      child: ListView.builder(
                            reverse: true,
                        controller: scrollController,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return messageList[index].id == userEmail?
                          ChatBubble(messagesModel: messageList[index],):
                          ChatBubbleForAnther(messagesModel: messageList[index],);
                        },

                      )

                  ),
                  Padding(padding: const EdgeInsets.all(16),
                    child: TextField(

                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          kMessage: data,
                          kCreatedAt: DateTime.now(),
                          'id': userEmail,

                        });
                        controller.clear();
                        scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
                      },

                      decoration: InputDecoration(
                          hintText: 'Sent Message',
                          suffixIcon: const Icon(
                            Icons.send, color: kPrimaryColor,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              )
                          )
                      ),
                    ),
                  )
                ],
              ),
            );
          }else{ return const Text('...Loading'); }

        },);
  }

}

