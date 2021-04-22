import 'package:flutter/material.dart';
import 'package:flutter_news_api/di/all_modules.dart';
import 'package:flutter_news_api/presentation/view/news_app.dart';

void main() async {
  DiModule().configure();
  runApp(NewsApp());
}
