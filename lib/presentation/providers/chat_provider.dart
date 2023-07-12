import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  List<Message> messageList = [
    Message(text: "testing", from: FromWho.me),
    Message(text: "ya regresaste del trabajo", from: FromWho.other),
  ];

  Future<void> sendMessage(String text) async {
	if (text.isEmpty) return;

    final newMessage = Message(text: text, from: FromWho.me);
    messageList.add(newMessage);

    notifyListeners();
	scrollTOBottom();
  }

  void scrollTOBottom() {
	scrollController.animateTo(
	  scrollController.position.maxScrollExtent,
	  duration: const Duration(milliseconds: 300),
	  curve: Curves.easeOut,
	);
  }
}
