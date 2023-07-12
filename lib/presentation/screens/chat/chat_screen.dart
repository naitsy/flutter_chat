import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

import '../../widgets/chat/her_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://avatarfiles.alphacoders.com/820/82072.jpg"),
          ),
        ),
        title: const Text('Emma'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  controller: chatProvider.scrollController,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context, index) {
                    return (chatProvider.messageList[index].from == FromWho.me)
                        ? MyMessageBubble( message: chatProvider.messageList[index] )
                        : const HerMessageBubble();
                  }),
            ),
            MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value) )
          ],
        ),
      ),
    );
  }
}
