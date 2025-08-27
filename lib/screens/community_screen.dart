import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text("Communities"),
            actions: const [
              Icon(Icons.qr_code_scanner_rounded),
              SizedBox(width: 10),
              Icon(Icons.more_vert),
              SizedBox(width: 10),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(1),
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.groups_2_outlined,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                border: Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(90),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Text(
                        "New Community",
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.grey.shade100,
                  height: 10,
                  thickness: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(1),
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade300.withOpacity(.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.groups_2_outlined,
                          color: Colors.indigoAccent,
                          size: 35,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text("Team_Phoenix", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => groups(title: loremIpsum(words: 1), sub: loremIpsum(words: 10)),
                childCount: 2),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 30),
                      Text('View all'),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey.shade100,
                  height: 10,
                  thickness: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: Center(
        child: Text("Community Screen"),
      ),
    );
  }

  Widget groups({required String title, required String sub}) {
    return ListTile(
      leading: Container(
        margin: EdgeInsets.all(1),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.greenAccent.shade700.withOpacity(.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.volume_up_outlined,
          color: Colors.green..withOpacity(1),
          size: 30,
        ),
      ),
      trailing: Text("10/9/2005"),
      title: Text(title),
      subtitle: Text(
        sub,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
