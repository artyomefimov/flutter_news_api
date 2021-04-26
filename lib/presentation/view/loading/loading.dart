import 'package:flutter/material.dart';
import 'package:flutter_news_api/presentation/constants.dart';

Widget loadingIndicator() => Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.indigo),
        strokeWidth: Dimensions.progressBarStrokeWidth,
      ),
    );
