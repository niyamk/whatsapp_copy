import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:phoenix/screens/chat_screen.dart';
import 'package:phoenix/variables.dart';

class UpdatesScreen extends StatefulWidget {
  const UpdatesScreen({super.key});

  @override
  State<UpdatesScreen> createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text("Updates"),
            actions: [
              Icon(Icons.qr_code_scanner_rounded),
              SizedBox(width: 20),
              Icon(Icons.search),
              SizedBox(width: 20),
              Icon(Icons.more_vert),
              SizedBox(width: 10),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Status",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: names.map(
                        (e) {
                          if (e[0] == names[0][0]) {
                            return Container(
                              height: 150,
                              width: 100,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(width: 2, color: Colors.grey.shade200),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.purple.shade100,
                                        child: Text(
                                          e[0][0].capitalize(),
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.white, width: 2),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Add status",
                                    style: TextStyle(fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Container(
                              height: 150,
                              width: 100,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/dummy.png'), fit: BoxFit.fill),
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 10,
                                    top: 10,
                                    child: Container(
                                      padding: EdgeInsets.all(2), // thickness of ring
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.green, // ring color
                                          width: 2, // ring thickness
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: getColorFromLetter(e[0]),
                                        // backgroundColor: Colors.purple.shade100,
                                        child: Text(
                                          e[0][0].capitalize(),
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: SizedBox(
                                        width: 70,
                                        child: Text(
                                          e[0],
                                          style:
                                              TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 12),
                                        ),
                                      )),
                                ],
                              ),
                            );
                          }
                        },
                      ).toList(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Channels",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 26,
                        width: 70,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              elevation: WidgetStatePropertyAll(0),
                              padding: WidgetStateProperty.all(EdgeInsets.zero),
                              backgroundColor: WidgetStateProperty.all(Colors.grey.shade200),
                              fixedSize: WidgetStateProperty.all(Size(90, 14))),
                          child: Text(
                            "Explore",
                            style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 25,
                      // backgroundColor: Colors.purple.shade100,
                      backgroundColor: getRandomColor(),

                      child: Text(
                        "S",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    title: Text("Sample Channel"),
                    subtitle: Text(
                      "Sample data for sample channel, dummy data you can just ignore it",
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text("10:10 pm"),
                  ),
                  SizedBox(height: 10),
                  Text("Find Channels to follow"),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _channels(name: channelsList[index][0], msg: '${((index + 1) * 9.23)}k Followers');
            },
            childCount: 10,
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 135,
                  height: 35,
                  child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey.shade200)),
                      child: Text(
                        "Explore more",
                        style: TextStyle(color: Colors.green),
                      )),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox(height: 120),
          ),
        ],
      ),
    );
  }

  Widget _channels({required String name, required String msg}) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        // backgroundColor: Colors.purple.shade100,
        backgroundColor: getColorFromLetter(name[0]),
        child: Text(
          name[0],
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
      ),
      trailing: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration:
            BoxDecoration(color: Colors.greenAccent.shade700.withOpacity(.3), borderRadius: BorderRadius.circular(20)),
        child: Text(
          "Follow",
          style: TextStyle(color: Colors.blueGrey),
        ),
      ),
      title: Text(name),
      subtitle: Text(msg),
    );
  }
}
