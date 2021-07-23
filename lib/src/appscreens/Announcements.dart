import 'package:airbus/src/Constants/loading.dart';
import 'package:airbus/src/Models/models.dart';
import 'package:airbus/src/services/db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Announcements extends StatefulWidget {
  @override
  _AnnouncementsState createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  Stream<QuerySnapshot> his;

  @override
  void initState() {
    DatabaseService().getannouncements().then((val) {
      setState(() {
        his = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          title: Text("Announcements"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[800],
        ),
        body: StreamBuilder(
            stream: his,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<DocumentSnapshot> documents = snapshot.data.docs;
                return ListView(
                    children: documents
                        .map((doc) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailedAnnouncements(
                                                  title: doc['title'],
                                                  content: doc['des'],
                                                )));
                                  },
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(doc['title']),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      doc['des'],
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .toList());
              } else {
                return Loading();
              }
            }),
      ),
    );
  }
}

class DetailedAnnouncements extends StatefulWidget {
  final String title;
  final String content;

  const DetailedAnnouncements({Key key, this.title, this.content})
      : super(key: key);

  @override
  _DetailedAnnouncementsState createState() => _DetailedAnnouncementsState();
}

class _DetailedAnnouncementsState extends State<DetailedAnnouncements> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[800],
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.content,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
