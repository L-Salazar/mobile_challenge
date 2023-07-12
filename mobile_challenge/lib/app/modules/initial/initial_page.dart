import 'package:flutter/material.dart';
import 'package:mobile_challenge/app/modules/favorites/favorites_page.dart';
import 'package:mobile_challenge/app/modules/history/history_page.dart';
import 'package:mobile_challenge/app/modules/words_list/word_list_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(
                    child: Text('Word list'),
                  ),
                  Tab(
                    child: Text('History'),
                  ),
                  Tab(
                    child: Text('Favorites'),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    WordListPage(),
                    HistoryPage(),
                    FavoritesPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
