import 'package:airbus/src/appscreens/Announcements.dart';
import 'package:airbus/src/appscreens/bot.dart';
import 'package:airbus/src/appscreens/feedback.dart';
import 'package:airbus/src/appscreens/support.dart';
import 'package:airbus/src/others/widgetlist.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[400],
        body: ListView(
          children: [
            SizedBox(
              height: 12,
            ),
            Container(
              height: size.height / 11,
              width: size.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      showSearch(context: context, delegate: Search());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 15, 20),
                        child: Row(
                          children: [
                            Text("Search..."),
                            Spacer(),
                            Icon(Icons.search)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: SizedBox(
                    height: 200,
                    width: size.width / 1.05,
                    child: Carousel(
                      images: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Announcements()));
                          },
                          child: Image.asset(
                            "assets/Asset3icons.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FeedBk()));
                          },
                          child: Image.asset(
                            "assets/Asset5icons.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Support()));
                          },
                          child: Image.asset(
                            "assets/Asset4icons.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChatBot()));
                          },
                          child: Image.asset(
                            "assets/Asset1icons.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Announcements()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/ann.png',
                            ),
                            fit: BoxFit.cover)),
                    height: size.height / 4,
                    width: size.width / 1.05,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => FeedBk()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/form.png',
                            ),
                            fit: BoxFit.cover)),
                    height: size.height / 4,
                    width: size.width / 1.05,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Support()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/supp.png',
                            ),
                            fit: BoxFit.cover)),
                    height: size.height / 4,
                    width: size.width / 1.05,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ChatBot()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/bot.png',
                            ),
                            fit: BoxFit.cover)),
                    height: size.height / 4,
                    width: size.width / 1.05,
                  ),
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.bug_report),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ChatBot()));
          },
        ),
      ),
    );
  }
}

class Search extends SearchDelegate<String> {
  final recent = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        child: buildSuggestions(context),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final myList = query.isEmpty
        ? recent
        : searchwlist()
            .where((p) => p.title.toLowerCase().contains(query))
            .toList();

    return ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) {
          final WList l = myList[index];
          return ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => l.widget));
            },
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(l.title),
            ),
          );
        });
  }
}
