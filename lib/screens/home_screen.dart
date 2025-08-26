import 'package:flutter/material.dart';
import 'package:phoenix/screens/chat_screen.dart';
import 'package:phoenix/screens/updates_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  final List<Widget> _screens = [
    ChatScreen(),
    UpdatesScreen(),
  ];
  final List<Tab> _tabs = [
    Tab(
      // text: "Chats",
      icon: Icon(Icons.chat),
      child: Text("chats app"),
    ) , 
    Tab(
      text: "Updates",
      icon: Icon(Icons.update),
    ) , 
    // Tab(
    //   text: "Communications",
    //   icon: Icon(Icons.group),
    // ),
    // Tab(
    //   text: "Call",
    //   icon: Icon(Icons.call),
    // ),
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
      
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("WhatsApp"),
        actions: const [
          Icon(Icons.camera),
          Icon(Icons.more_vert),
        ],
      ),
      body: TabBarView(children: _screens,
      controller: _tabController,),
      bottomNavigationBar: TabBar(tabs: _tabs, controller: _tabController,),
    );
  }
}