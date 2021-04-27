import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/presentation/constants.dart';
import 'package:flutter_news_api/presentation/view/filter/filter_alert_dialog.dart';

typedef FilterClickedCallback = void Function(String);

class FilterItem extends StatelessWidget {
  late final String text;
  late final String dialogTitle;
  late final List<String> dialogContent;
  late final FilterClickedCallback onClicked;

  FilterItem({
    required this.text,
    required this.dialogTitle,
    required this.onClicked,
    required this.dialogContent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModal(
          context: context,
          configuration: _configuration(),
          builder: (context) =>
              FilterAlertDialog(
                title: dialogTitle,
                content: dialogContent,
              ),
        ).then((value) => onClicked(value));
      },
      child: _item(text),
    );
  }

  FadeScaleTransitionConfiguration _configuration() =>
      FadeScaleTransitionConfiguration(
        transitionDuration: Duration(
          milliseconds: 300,
        ),
      );

  Widget _item(String text) =>
      Material(
        elevation: Dimensions.defaultElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Dimensions.filterItemRadius),
          ),
        ),
        color: Colors.indigoAccent,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.marginEight,
            horizontal: Dimensions.marginTen,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: Dimensions.articleDescriptionTextSize,
              color: Colors.white,
            ),
          ),
        ),
      );
}
