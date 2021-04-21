import 'package:flutter/material.dart';
import 'package:flutter_news_api/di/all_modules.dart';
import 'file:///C:/FlutterApps/flutter_news_api/flutter_news_api/lib/presentation/view/news_app.dart';

void main() async {
  DiModule().configure();
  runApp(NewsApp());
}
