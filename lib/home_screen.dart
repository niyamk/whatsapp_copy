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
  final List<Widget> _screens = [
    ChatScreen(),
    UpdatesScreen(),
    CommunityScreen(),
    CallScreen(),
  ];
  final List<Tab> _tabs = [
    Tab(
      // text: "Chats",
      icon: Icon(Icons.chat),
      child: Text("chats app"),
    ),
    Tab(
      text: "Updates",
      icon: Icon(Icons.update),
    ),
    Tab(
      text: "Communications",
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
      body: TabBarView(
        controller: _tabController,
        children: _screens,
      ),
      bottomNavigationBar: TabBar(
        tabs: _tabs,
        controller: _tabController,
      ),
    );
  }
}
