import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class InChatScreen extends StatefulWidget {
  final String name;
  const InChatScreen({super.key, required this.name});

  @override
  State<InChatScreen> createState() => _InChatScreenState();
}

class _InChatScreenState extends State<InChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leadingWidth: 20,
            leading: BackButton(),
            // leading: Icon(Icons.arrow_back),
            title: Row(
              children: [
                CircleAvatar(
                  child: Text(widget.name[0]),
                ),
                SizedBox(width: 10),
                Text(widget.name),
              ],
            ),
            actions: [Icon(Icons.more_vert)],
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return message(sentByMe: Random().nextBool(), message: loremIpsum(words: 5));
            },
            childCount: 20,
          ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Type a message...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.attach_file),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.camera_alt_outlined),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget message({required bool sentByMe, required String message}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Align(
            alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.all(10),
              width: 250,
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: sentByMe
                  ? BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12), // No curve on the left to create the tail effect
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    )
                  : BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0), // No curve on the left to create the tail effect
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Sender's name with custom color
                  // Text(
                  //   sentByMe?"" :  ,
                  //   style: const TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     color: Color(0xFFD200A8), // A shade of pink/purple for the name
                  //   ),
                  // ),
                  // const SizedBox(height: 4.0),
                  // // Message text
                  Text(
                    message,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4.0),
                  // Timestamp aligned to the right
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '10:10 am',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
