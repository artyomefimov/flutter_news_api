import 'package:flutter/material.dart';
import 'package:flutter_news_api/domain/model/news/article.dart';
import 'package:flutter_news_api/presentation/constants.dart';
import 'package:flutter_news_api/presentation/view/image/image_loading_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends StatefulWidget {
  late final Article article;

  ArticleDetailsScreen({Key? key, required this.article}) : super(key: key);

  @override
  _ArticleDetailsScreenState createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Widget _body() =>
      Container(
        padding: EdgeInsets.all(Dimensions.marginNormal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _authorAndSource(),
            _marginDefault(),
            _title(),
            _marginDefault(),
            _checkInSource(),
            _marginDefault(),
            _articleImage(),
            _marginDefault(),
            _content(),
            _marginDefault(),
            _publishDate(),
          ],
        ),
      );

  Widget _authorAndSource() =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              widget.article.sourceName,
              style: TextStyle(
                fontSize: Dimensions.articleMainTextSize,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            width: Dimensions.marginNormal,
          ),
          Expanded(
            child: Text(
              widget.article.author,
              style: TextStyle(
                fontSize: Dimensions.articleMainTextSize,
                color: Colors.grey,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );

  Widget _title() =>
      Text(
        widget.article.title,
        style: TextStyle(
          fontSize: Dimensions.articleTitleTextSize,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      );

  Widget _checkInSource() => InkWell(
    child: Text(
      Strings.checkInSource,
      style: TextStyle(
        fontSize: Dimensions.articleDescriptionTextSize,
        color: Colors.lightBlue,
      ),
    ),
    onTap: () async {
      if (await canLaunch(widget.article.url)) {
        await launch(widget.article.url);
      }
    },
  );

  Widget _articleImage() => networkImage(widget.article.urlToImage);

  Widget _content() => Text(
    widget.article.description,
    style: TextStyle(
      fontSize: Dimensions.articleDescriptionTextSize,
      color: Colors.black87,
    ),
  );

  Widget _publishDate() => Text(
    widget.article.publishDate,
    style: TextStyle(
      fontSize: Dimensions.articleInfoTextSize,
      color: Colors.grey,
      fontWeight: FontWeight.normal,
    ),
  );

  Widget _marginDefault() =>
      SizedBox(
        height: Dimensions.marginNormal,
      );
}
