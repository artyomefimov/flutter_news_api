import 'package:flutter/material.dart';
import 'package:flutter_news_api/presentation/constants.dart';

typedef ErrorClickedCallback = void Function();

class ErrorItem extends StatelessWidget {
  ErrorItem({required this.onRetryClicked});

  late final ErrorClickedCallback onRetryClicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Paths.imageErrorPlaceholder),
        Text(
          Strings.errorMessage,
          style: TextStyle(
            fontSize: Dimensions.articleMainTextSize,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: Dimensions.marginNormal),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
          ),
          child: Text(Strings.retryButtonMessage,
            style: TextStyle(
              fontSize: Dimensions.articleMainTextSize,
              color: Colors.white,
            ),
          ),
            onPressed: onRetryClicked,
        ),
      ],
    );
  }
}
