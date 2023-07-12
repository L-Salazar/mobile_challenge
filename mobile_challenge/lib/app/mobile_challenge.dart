import 'package:flutter/material.dart';
import 'package:mobile_challenge/app/modules/initial/initial_page.dart';
import 'package:mobile_challenge/app/modules/not_found/not_found_page.dart';
import 'package:mobile_challenge/app/modules/word_detail/word_detail_page.dart';

class MobileChallenge extends StatelessWidget {
  const MobileChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Challenge',
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => const InitialPage(),
        '/word_detail': (context) => WordDetailPage(
              keyword:
                  ModalRoute.of(context)?.settings.arguments as String? ?? '',
            ),
        '/not_found': (context) => const NotFoundPage()
      },
    );
  }
}
