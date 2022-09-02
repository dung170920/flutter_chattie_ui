import 'package:flutter/material.dart';
import 'package:flutter_chattie_ui/app_theme.dart';
import 'package:flutter_chattie_ui/models/message_model.dart';
import 'package:flutter_chattie_ui/pages/pages.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            children: [
              Text(
                'Recent Chats',
                style: MyTheme.heading2,
              ),
              const Spacer(),
              Icon(
                Icons.search,
                color: MyTheme.kPrimaryColor,
              )
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (context, int index) {
            final recentChat = recentChats[index];
            return Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(recentChat.avatar ?? ''),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatRoomPage(
                            user: recentChat.sender!,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            recentChat.sender?.name ?? '',
                            style: MyTheme.heading2.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            recentChat.text ?? '',
                            style: MyTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: MyTheme.kUnreadChatBG,
                          child: Text(
                            recentChat.unreadCount.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          recentChat.time ?? '00:00',
                          style: MyTheme.bodyTextTime,
                        )
                      ],
                    )
                  ],
                ));
          },
          itemCount: recentChats.length,
        )
      ],
    );
  }
}
