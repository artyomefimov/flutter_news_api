import 'package:flutter/material.dart';
import 'package:flutter_news_api/domain/model/category.dart';
import 'package:flutter_news_api/domain/model/country.dart';
import 'package:flutter_news_api/presentation/constants.dart';

class CategoryAlertDialog extends StatelessWidget {
  final categories = allCategoryValues();

  @override
  Widget build(BuildContext context) => _alertDialog(
        context: context,
        title: Strings.chooseCategory,
        content: categories,
      );
}

class CountryAlertDialog extends StatelessWidget {
  final countries = allCountryNames();

  @override
  Widget build(BuildContext context) => _alertDialog(
        context: context,
        title: Strings.chooseCountry,
        content: countries,
      );
}

Widget _alertDialog({
  required BuildContext context,
  required String title,
  required List<String> content,
}) {
  return AlertDialog(
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
}

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
