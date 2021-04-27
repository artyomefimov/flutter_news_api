import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/presentation/constants.dart';
import 'package:flutter_news_api/presentation/view/everything/route/all_news_route.dart';
import 'package:flutter_news_api/presentation/view/top/route/top_highlights_route.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static final Map<int, Widget> _items = {};
  var _currentIndex = 0;

  @override
  void initState() {
    _items[0] = topHighlightsScreen(context);
    _items[1] = allNewsScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.newsApp),
        centerTitle: true,
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnim, secondaryAnim) =>
            FadeThroughTransition(
          animation: primaryAnim,
          secondaryAnimation: secondaryAnim,
          child: child,
        ),
        child: _items.entries
            .firstWhere((entry) => entry.key == _currentIndex)
            .value,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _bottomItems(),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.indigo,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  List<BottomNavigationBarItem> _bottomItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.local_fire_department,
        ),
        label: Strings.topHighlights,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.subject,
        ),
        label: Strings.everything,
      ),
    ];
  }
}
