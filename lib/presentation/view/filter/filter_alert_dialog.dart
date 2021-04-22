import 'package:flutter/material.dart';
import 'package:flutter_news_api/presentation/constants.dart';

class FilterAlertDialog extends StatelessWidget {
  late final String title;
  late final List<String> content;

  FilterAlertDialog({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(title),
        content: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _alertDialogItemGenerator(context, content),
            ),
          ),
        ),
      );

  List<Widget> _alertDialogItemGenerator(
          BuildContext context, List<String> content) =>
      content
          .map(
            (e) => GestureDetector(
              onTap: () => Navigator.pop(context, e),
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.marginEight),
                child: Text(
                  e,
                  style: TextStyle(
                    fontSize: Dimensions.articleTitleTextSize,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          )
          .toList(
            growable: false,
          );
}
