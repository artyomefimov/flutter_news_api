import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/domain/model/article.dart';
import 'package:flutter_news_api/presentation/constants.dart';
import 'package:flutter_news_api/presentation/view/details/article_details_screen.dart';

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
      child: OpenContainer(
        closedBuilder: (context, action) => _item(),
        openBuilder: (context, action) => ArticleDetailsScreen(
          article: article,
        ),
      ),
    );
  }

  Widget _item() => Container(
        padding: EdgeInsets.all(Dimensions.marginNormal),
        child: Column(
          children: [
            _title(),
            _marginDefault(),
            _description(),
            _marginDefault(),
            _image(),
            _marginDefault(),
            _sourceNameAndPublishDate(),
          ],
        ),
      );

  Widget _title() => Text(
        article.title,
        style: TextStyle(
          fontSize: Dimensions.articleTitleTextSize,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _description() => Text(
        article.description,
        style: TextStyle(
          fontSize: Dimensions.articleDescriptionTextSize,
          fontWeight: FontWeight.normal,
        ),
      );

  Widget _marginDefault() => SizedBox(
        height: Dimensions.marginNormal,
      );

  Widget _image() => Image.network(article.urlToImage);

  Widget _sourceNameAndPublishDate() => Row(
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
      );
}
