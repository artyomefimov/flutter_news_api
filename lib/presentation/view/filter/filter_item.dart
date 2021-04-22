import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/presentation/constants.dart';
import 'package:flutter_news_api/presentation/view/filter/filter_alert_dialog.dart';
import 'package:flutter_news_api/presentation/view/filter/filter_items.dart';

class CountryFilterItem extends StatelessWidget {
  late final String text;
  late final FilterClickedCallback onClicked;

  CountryFilterItem({required this.text, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModal(
          context: context,
          configuration: FadeScaleTransitionConfiguration(
            transitionDuration: Duration(
              milliseconds: 300,
            ),
          ),
          builder: (context) => CountryAlertDialog(),
        ).then((value) => onClicked(value));
      },
      child: filterItem("Country: $text"),
    );
  }
}

class CategoryFilterItem extends StatelessWidget {
  late final String text;
  late final FilterClickedCallback onClicked;

  CategoryFilterItem({required this.text, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModal(
          context: context,
          configuration: FadeScaleTransitionConfiguration(
            transitionDuration: Duration(
              milliseconds: 300,
            ),
          ),
          builder: (context) => CategoryAlertDialog(),
        ).then((value) => onClicked(value));
      },
      child: filterItem("Category: $text"),
    );
  }
}

Widget filterItem(String text) => Material(
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
