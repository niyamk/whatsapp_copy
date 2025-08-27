import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:phoenix/screens/chat_screen.dart';

import '../variables.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  String lorem = loremIpsum(words: 2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text("Calls"),
            actions: const [
              Icon(Icons.qr_code_scanner_rounded),
              SizedBox(width: 10),
              Icon(Icons.search),
              SizedBox(width: 10),
              Icon(Icons.more_vert),
              SizedBox(width: 10),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Favourites",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 26,
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              elevation: WidgetStatePropertyAll(0),
                              padding: WidgetStateProperty.all(EdgeInsets.zero),
                              backgroundColor: WidgetStateProperty.all(Colors.grey.shade200),
                              fixedSize: WidgetStateProperty.all(Size(90, 14))),
                          child: Text(
                            "More",
                            style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Text(lorem[0].toUpperCase()),
                        ),
                        Spacer(),
                        Text(
                          lorem.capitalize(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(flex: 8),
                        Icon(Icons.call_outlined),
                        Spacer(flex: 2),
                        Icon(Icons.videocam_outlined),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Recent",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => calls(name: loremIpsum(words: 1), incoming: Random().nextBool()),
            childCount: 20,
          )),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox(
              height: 50,
            ),
          ),
        ],
      ),
    );
  }

  Widget calls({required String name, required bool incoming}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: getRandomColor(),
        child: Text(name[0]),
      ),
      title: Text(name.capitalize()),
      trailing: Icon(Icons.call_outlined),
      subtitle: Row(
        children: [
          Icon(
            incoming ? Icons.call_received_rounded : Icons.call_made,
            color: Colors.green,
            size: 15,
          ),
          Text('Yesterday, 10:10 am'),
        ],
      ),
    );
  }
}
