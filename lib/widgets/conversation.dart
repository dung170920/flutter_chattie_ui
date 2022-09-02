import 'package:flutter/material.dart';
import 'package:flutter_chattie_ui/app_theme.dart';
import 'package:flutter_chattie_ui/models/message_model.dart';
import 'package:flutter_chattie_ui/models/user_model.dart';
import 'package:flutter_chattie_ui/pages/pages.dart';

class Conversation extends StatelessWidget {
  const Conversation({
    Key? key,
    required this.widget,
    required this.size,
  }) : super(key: key);

  final ChatRoomPage widget;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemBuilder: (context, int index) {
        final message = messages[index];
        bool isMe = message.sender!.id == currentUser.id;
        return Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment:
                    isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  if (!isMe)
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(widget.user.avatar ?? ''),
                    ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    constraints: BoxConstraints(maxWidth: size.width * 0.5),
                    decoration: BoxDecoration(
                      color: isMe ? MyTheme.kAccentColor : Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: Radius.circular(isMe ? 12 : 0),
                        bottomRight: Radius.circular(!isMe ? 12 : 0),
                      ),
                    ),
                    child: Text(
                      message.text ?? '',
                      style: MyTheme.bodyTextMessage.copyWith(
                          color: isMe ? Colors.white : Colors.grey[800]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment:
                      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isMe)
                      const SizedBox(
                        width: 40,
                      ),
                    Icon(
                      Icons.done_all,
                      size: 20,
                      color: MyTheme.bodyTextTime.color,
                    ),
                    Text(
                      message.time ?? '',
                      style: MyTheme.bodyTextTime,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      itemCount: messages.length,
    );
  }
}
