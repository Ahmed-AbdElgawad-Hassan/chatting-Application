import 'package:chat/models/message.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Chatbubbleforfriend extends StatelessWidget {
   Chatbubbleforfriend({super.key,required this.message});
  Message message ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:  const EdgeInsets.all(20),
        margin:const EdgeInsets.all(10),
        decoration:const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30))),
        child: Text(
          message.text,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }
}
