import 'package:flutter/material.dart';
import 'package:flutter_news_api/presentation/constants.dart';

Widget networkImage(String path) => Container(
  height: Dimensions.imageContainerSize,
  child: Image.network(path,
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) {
        return child;
      }
      return _imageLoadingIndicator(loadingProgress);
    },
    errorBuilder: (context, _, __) {
      return Image.asset(Paths.imageErrorPlaceholder);
    },
  ),
);

Widget _imageLoadingIndicator(ImageChunkEvent loadingProgress) =>
    Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
            loadingProgress.expectedTotalBytes!
            : null,
      ),
    );