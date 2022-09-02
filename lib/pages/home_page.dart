import 'package:flutter/material.dart';
import 'package:flutter_chattie_ui/app_theme.dart';
import 'package:flutter_chattie_ui/pages/pages.dart';
import 'package:flutter_chattie_ui/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  int currentTabIndex = 0;

  void onTabChange() {
    setState(() {
      currentTabIndex = tabController.index;
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      onTabChange();
    });
  }

  @override
  void dispose() {
    tabController.addListener(() {
      onTabChange();
    });
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: Center(
          child: Text(
            'Chattie',
            style: MyTheme.kAppTitle,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt),
          ),
        ],
      ),
      backgroundColor: MyTheme.kPrimaryColor,
      body: Column(
        children: [
          MyTabBar(tabController: tabController),
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
              child: TabBarView(
                controller: tabController,
                children: const [
                  ChatPage(),
                  Center(
                    child: Text('Status'),
                  ),
                  Center(
                    child: Text('Calls'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          currentTabIndex == 0
              ? Icons.message_outlined
              : currentTabIndex == 1
                  ? Icons.camera_alt
                  : Icons.call,
          color: Colors.white,
        ),
      ),
    );
  }
}
