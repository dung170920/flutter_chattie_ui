import 'package:flutter/material.dart';
import 'package:flutter_chattie_ui/widgets/widgets.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          RecentChats(),
          AllChats(),
        ],
      ),
    );
  }
}
