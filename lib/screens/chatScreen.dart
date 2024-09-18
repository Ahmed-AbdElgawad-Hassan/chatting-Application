import 'package:chat/components/chatBubble.dart';
import 'package:chat/components/chatBubbleforFriend.dart';
import 'package:chat/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  final ScrollController _scrollController = ScrollController();

  TextEditingController controller = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference message =
      FirebaseFirestore.instance.collection('message');
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder(
        stream: message.orderBy('CreatedAt',descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              backgroundColor: const Color(0xffFAB714),
              body: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 30),
                      width: double.infinity,
                      child: Image.asset(
                        'assets/Yellow Black Chat Message Logo.png',
                        fit: BoxFit.cover,
                        height: 150,
                      )), // Displaying the image
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                        controller: _scrollController,
                        itemCount: messageList.length,
                        itemBuilder: (context, index) {
                          return messageList[index].id == email
                              ? Chatbubble(
                                  message: messageList[index],
                                )
                              : Chatbubbleforfriend(
                                  message: messageList[index]);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 25, left: 15, right: 15, bottom: 20),
                    child: TextField(
                      controller: controller,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                          hintText: 'Send Message',
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.3),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.5)),
                          suffixIcon: IconButton(
                              icon: Icon(
                                Icons.send,
                                color: Colors.grey[600],
                                size: 35,
                              ),
                              onPressed: () {
                                message.add({
                                  'text': controller.text,
                                  'CreatedAt': DateTime.now(),
                                  'id': email
                                });
                                controller.clear();
                                _scrollController.animateTo(
                                  0,
                                   duration: Duration(milliseconds: 5), 
                                   curve: Curves.bounceIn);
                              })),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text("loading...");
          }
        });
  }
}
