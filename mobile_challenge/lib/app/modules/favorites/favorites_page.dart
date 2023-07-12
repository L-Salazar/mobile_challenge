import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_challenge/app/core/config/locator.dart';
import 'package:mobile_challenge/app/core/helpers/loader.dart';
import 'package:mobile_challenge/app/core/helpers/messages.dart';
import 'package:mobile_challenge/app/core/ui/styles/app_text_styles.dart';
import 'package:mobile_challenge/app/models/word.dart';
import 'package:mobile_challenge/app/modules/favorites/favorites_controller.dart';
import 'package:mobx/mobx.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> with Loader, Messages {
  final controller = getIt.get<FavoritesController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reaction((_) => controller.status, (status) {
        switch (status) {
          case FavoriteStateStatus.initial:
            break;
          case FavoriteStateStatus.loading:
            showLoader();
            break;
          case FavoriteStateStatus.sucess:
            hideLoader();
            break;
          case FavoriteStateStatus.error:
            hideLoader();
            showError('Erro ao buscar histórico de palavras');
        }
      });
      controller.getFavoritesWords();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Page'),
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.favoriteWords.length,
            itemBuilder: (context, index) {
              final word = controller.favoriteWords[index] as Word;
              return ListTile(
                title: Text(
                  word.name,
                  style: context.textStyles.textSemiBold.copyWith(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(word.meaning, maxLines: 2),
              );
            },
          );
        },
      ),
    );
  }
}
