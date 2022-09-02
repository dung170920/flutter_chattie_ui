import 'package:flutter/material.dart';
import 'package:flutter_chattie_ui/app_theme.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.grey[500],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type your message ...',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.attach_file,
                    color: Colors.grey[500],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          CircleAvatar(
            backgroundColor: MyTheme.kAccentColor,
            child: const Icon(
              Icons.mic,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
