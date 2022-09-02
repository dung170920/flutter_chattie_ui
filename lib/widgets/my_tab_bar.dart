import 'package:flutter/material.dart';
import 'package:flutter_chattie_ui/app_theme.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: TabBar(
        controller: tabController,
        indicator: ShapeDecoration(
            color: MyTheme.kAccentColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        tabs: const [
          Tab(
            icon: Text(
              'Chat',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Tab(
            icon: Text(
              'Status',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Tab(
            icon: Text(
              'Calls',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
