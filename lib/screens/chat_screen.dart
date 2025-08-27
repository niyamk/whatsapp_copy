import 'package:flutter/material.dart';
import 'package:phoenix/screens/in_chat_screen.dart';
import 'package:phoenix/variables.dart';
import "package:lorem_ipsum/lorem_ipsum.dart";

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => ChatScreenState();
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

class ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              "WhatsApp",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: const [
              Icon(Icons.qr_code_scanner_rounded),
              SizedBox(width: 20),
              Icon(Icons.camera_alt_outlined),
              SizedBox(width: 20),
              Icon(Icons.more_vert),
              SizedBox(width: 10),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      isDense: true,
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  Row(
                    children: ["All", "Unread", "Favourites", "Groups"]
                        .map(
                          (e) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1, color: Colors.grey.shade200),
                            ),
                            child: Text(
                              e,
                              style: TextStyle(color: Colors.grey.shade800),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _chatList(name: names[index][0], msg: loremIpsum(words: 10));
            },
            childCount: names.length,
          )),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(height: 100, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _chatList({required String name, required String msg}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InChatScreen(name: name),
            )),
        title: Text(name),
        subtitle: Text(
          msg,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text("10:10 am"),
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: getRandomColor(),
          // backgroundColor: Colors.purple[100],
          child: Text(
            name[0].toUpperCase(),
            style: TextStyle(
              color: Colors.purple[800],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
