import 'package:flutter/material.dart';
import 'package:flutter_news_api/domain/model/article.dart';
import 'package:flutter_news_api/presentation/constants.dart';

class ArticleItem extends StatelessWidget {
  late final Article article;

  ArticleItem(this.article);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: Dimensions.elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.itemRadius),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.marginNormal,
              left: Dimensions.marginNormal,
              right: Dimensions.marginNormal,
            ),
            child: Text(
              article.title,
              style: TextStyle(
                fontSize: Dimensions.articleTitleTextSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.marginNormal,
              left: Dimensions.marginNormal,
              right: Dimensions.marginNormal,
            ),
            child: Text(
              article.description,
              style: TextStyle(
                fontSize: Dimensions.articleDescriptionTextSize,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.marginNormal,
              left: Dimensions.marginNormal,
              right: Dimensions.marginNormal,
            ),
            child: Image.network(article.urlToImage),
          ),
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.marginNormal,
              left: Dimensions.marginNormal,
              right: Dimensions.marginNormal,
              bottom: Dimensions.marginNormal,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  article.sourceName,
                  style: TextStyle(
                    fontSize: Dimensions.articleInfoTextSize,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  width: Dimensions.marginNormal,
                ),
                Text(
                  article.publishDate,
                  style: TextStyle(
                    fontSize: Dimensions.articleInfoTextSize,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
