import 'package:airbus/src/appscreens/Announcements.dart';
import 'package:airbus/src/appscreens/bot.dart';
import 'package:airbus/src/appscreens/feedback.dart';
import 'package:airbus/src/appscreens/support.dart';
import 'package:flutter/material.dart';

class WList {
  final String title;
  final Widget widget;

  WList({this.title, this.widget});
}

List<WList> searchwlist() {
  var s = <WList>[
    WList(title: "Announcements", widget: Announcements()),
    WList(title: "FeedBack", widget: FeedBk()),
    WList(title: "Support", widget: Support()),
    WList(title: "ChatBot", widget: ChatBot()),
  ];
  return s;
}
