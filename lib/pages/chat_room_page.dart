import 'package:flutter/material.dart';
import 'package:flutter_chattie_ui/app_theme.dart';
import 'package:flutter_chattie_ui/models/user_model.dart';
import 'package:flutter_chattie_ui/widgets/widgets.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: false,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(widget.user.avatar!),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.name!,
                  style: MyTheme.chatSenderName,
                ),
                Text(
                  'online',
                  style: MyTheme.bodyText1.copyWith(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.videocam_outlined,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
              size: 26,
            ),
          ),
        ],
      ),
      backgroundColor: MyTheme.kPrimaryColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Conversation(widget: widget, size: size),
                ),
              ),
            ),
            const ChatInput()
          ],
        ),
      ),
    );
  }
}
