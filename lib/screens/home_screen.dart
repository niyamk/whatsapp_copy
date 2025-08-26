import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(text: "CHATS"),
    Tab(text: "STATUS"),
    Tab(text: "CALLS"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp'),
          backgroundColor: Color(0xFF075E54),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
          bottom: TabBar(
            tabs: tabs,
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            ChatsTab(),
            Center(child: Text('Status Tab')),
            Center(child: Text('Calls Tab')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF25D366),
          child: Icon(Icons.message, color: Colors.white),
          onPressed: () {},
        ),
      ),
    );
  }
}

class ChatsTab extends StatelessWidget {
  final List<Map<String, String>> chats = [
    {
      "name": "Alice",
      "message": "Hey! How are you?",
      "time": "12:30 PM",
      "avatar": "A",
    },
    {
      "name": "Bob",
      "message": "Let's catch up later.",
      "time": "11:15 AM",
      "avatar": "B",
    },
    {
      "name": "Charlie",
      "message": "Check out this photo!",
      "time": "Yesterday",
      "avatar": "C",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            child: Text(chat["avatar"] ?? "", style: TextStyle(color: Colors.white)),
          ),
          title: Text(chat["name"] ?? ""),
          subtitle: Text(chat["message"] ?? ""),
          trailing: Text(chat["time"] ?? ""),
          onTap: () {},
        );
      },
    );
  }
}