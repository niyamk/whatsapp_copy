import 'package:flutter/material.dart';
import 'package:phoenix/screens/call_screen.dart';
import 'package:phoenix/screens/chat_screen.dart';
import 'package:phoenix/screens/community_screen.dart';
import 'package:phoenix/screens/updates_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  final List<Widget> _screens = [
    ChatScreen(),
    UpdatesScreen(),
    CommunityScreen(),
    CallScreen(),
  ];
  final List<Tab> _tabs = [
    Tab(
      text: "Chats",
      icon: Icon(Icons.chat),
    ),
    Tab(
      text: "Updates",
      icon: Icon(Icons.update),
    ),
    Tab(
      text: "Communities",
      icon: Icon(Icons.groups_2_outlined),
    ),
    Tab(
      text: "Call",
      icon: Icon(Icons.call_outlined),
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _currentIndex = _tabController.index;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _currentIndex == 2
          ? null
          : FloatingActionButton(
              onPressed: () {},
              child: Icon(
                [Icons.add_comment, Icons.add_a_photo_outlined, Icons.add, Icons.add_call][_tabController.index],
                color: Colors.white,
              ),
            ),
      body: TabBarView(
        controller: _tabController,
        children: _screens,
      ),
      bottomNavigationBar: TabBar(
        labelPadding: EdgeInsets.symmetric(horizontal: 5),
        tabs: _tabs,
        controller: _tabController,
      ),
    );
  }
}
