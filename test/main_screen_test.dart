import 'package:flutter_news_api/di/all_modules.dart';
import 'package:flutter_news_api/presentation/constants.dart';
import 'package:flutter_news_api/presentation/view/everything/screen/all_filter_items.dart';
import 'package:flutter_news_api/presentation/view/everything/screen/all_news_screen.dart';
import 'package:flutter_news_api/presentation/view/news_app.dart';
import 'package:flutter_news_api/presentation/view/top/screen/top_filter_items.dart';
import 'package:flutter_news_api/presentation/view/top/screen/top_highlights_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() => DiModule().configure());
  mainScreenTest();
}

void mainScreenTest() =>
    testWidgets('Simple test for main screen', (WidgetTester tester) async {
      await tester.pumpWidget(NewsApp());

      await tester.tap(find.text(Strings.topHighlights));
      await tester.pump();

      expect(find.byType(TopHighlightsScreen), findsOneWidget);
      expect(find.byType(TopFilterItems), findsOneWidget);

      await tester.tap(find.text(Strings.everything));
      await tester.pump();

      expect(find.byType(AllNewsScreen), findsOneWidget);
      expect(find.byType(AllNewsFilterItems), findsOneWidget);
    });