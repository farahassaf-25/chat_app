import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class CustomChatBubble extends StatelessWidget {
  const CustomChatBubble({Key? key, required this.message}) : super(key: key);

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 15, top: 30, bottom: 30, right: 30),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: const BoxDecoration(
          color: kBlueColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Text(
          message.message,
          style: const TextStyle(color: kWhiteColor),
        ),
      ),
    );
  }
}

class CustomChatFromFriend extends StatelessWidget {
  const CustomChatFromFriend({Key? key, required this.message})
      : super(key: key);
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 15, top: 30, bottom: 30, right: 30),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Text(
          message.message,
          style: const TextStyle(color: kWhiteColor),
        ),
      ),
    );
  }
}
