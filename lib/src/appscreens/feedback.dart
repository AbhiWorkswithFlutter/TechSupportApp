import 'package:airbus/src/Constants/loading.dart';
import 'package:airbus/src/services/db.dart';
import 'package:flutter/material.dart';

class FeedBk extends StatefulWidget {
  @override
  _FeedBkState createState() => _FeedBkState();
}

class _FeedBkState extends State<FeedBk> {
  final _formkey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String title = '';
  String des = '';
  String severity = 'Low';
  final snackBar = SnackBar(content: Text('Feedback Sent!'));
  @override
  Widget build(BuildContext context) {
    bool loading = false;

    return loading == true
        ? Loading()
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text("Feedback"),
                centerTitle: true,
                backgroundColor: Colors.blueGrey[800],
              ),
              body: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                                margin: EdgeInsets.only(right: 20, left: 10),
                                child: TextFormField(
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter valid Title' : null,
                                  onChanged: (val) {
                                    setState(() => title = val);
                                  },
                                  decoration:
                                      InputDecoration(hintText: 'Title'),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                                margin: EdgeInsets.only(right: 20, left: 10),
                                child: TextFormField(
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter valid Name' : null,
                                  onChanged: (val) {
                                    setState(() => name = val);
                                  },
                                  decoration: InputDecoration(hintText: 'Name'),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                                margin: EdgeInsets.only(right: 20, left: 10),
                                child: TextFormField(
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter valid Email' : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                  decoration:
                                      InputDecoration(hintText: 'Email'),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                                margin: EdgeInsets.only(right: 20, left: 10),
                                child: new DropdownButton<String>(
                                  value: severity,
                                  hint: Text("Severity"),
                                  iconSize: 30,
                                  isExpanded: true,
                                  items: <String>['Low', 'Medium', 'High']
                                      .map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      severity = val;
                                    });
                                  },
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(width: 1)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: TextFormField(
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                            maxLength: 1000,
                                            maxLines: 8,
                                            validator: (val) => val.isEmpty
                                                ? 'Enter Description'
                                                : null,
                                            onChanged: (val) {
                                              setState(() => des = val);
                                            },
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Description'),
                                          ),
                                        ))),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formkey.currentState.validate()) {
                                      DatabaseService().saveData(
                                          title, email, name, des, severity);

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  // color: Colors.blueAccent,
                                  child: Text(
                                    'submit',
                                    style: TextStyle(
                                        color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
