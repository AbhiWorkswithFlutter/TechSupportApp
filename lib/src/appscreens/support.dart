import 'package:airbus/src/Constants/loading.dart';
import 'package:airbus/src/services/db.dart';
import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final _formkey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String title = '';
  String des = '';
  @override
  Widget build(BuildContext context) {
    bool loading = false;
    final snackBar = SnackBar(content: Text('Bug Reported!'));
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text("IT Support"),
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
                                                hintText:
                                                    'Describe the bug in brief'),
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
                                      setState(() => loading = true);
                                      DatabaseService().saveSupportData(
                                          title, email, name, des);

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
