import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_challenge/app/core/config/locator.dart';
import 'package:mobile_challenge/app/core/helpers/loader.dart';
import 'package:mobile_challenge/app/core/helpers/messages.dart';
import 'package:mobile_challenge/app/core/helpers/size_extensions.dart';
import 'package:mobile_challenge/app/core/ui/styles/app_text_styles.dart';
import 'package:mobile_challenge/app/modules/word_detail/word_detail_controller.dart';
import 'package:mobile_challenge/app/modules/words_list/word_list_controller.dart';
import 'package:mobx/mobx.dart';

class WordDetailPage extends StatefulWidget {
  final String keyword;

  const WordDetailPage({
    required this.keyword,
    super.key,
  });

  @override
  State<WordDetailPage> createState() => _WordDetailPageState();
}

class _WordDetailPageState extends State<WordDetailPage> with Loader, Messages {
  final controller = getIt.get<WordDetailController>();
  final wordListController = getIt.get<WordListController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reaction((_) => controller.status, (status) {
        switch (status) {
          case WordDetailStateStatus.initial:
            break;
          case WordDetailStateStatus.loading:
            showLoader();
            break;
          case WordDetailStateStatus.sucess:
            hideLoader();
            break;
          case WordDetailStateStatus.favorited:
            setState(() {});
            showSucess('Palavra favorita com sucesso');
            break;
          case WordDetailStateStatus.unfavorited:
            setState(() {});
            showWarning('Palavra removida dos favoritos');
            break;

          case WordDetailStateStatus.nextWord:
            hideLoader();
            Navigator.of(context).pushReplacementNamed(
              '/word_detail',
              arguments: controller.getNextWord(
                wordListController.wordsList as List<String>,
                controller.word?.name ?? '',
              ),
            );
          case WordDetailStateStatus.previousWord:
            hideLoader();
            Navigator.of(context).pushReplacementNamed(
              '/word_detail',
              arguments: controller.getPreviousWord(
                wordListController.wordsList as List<String>,
                controller.word?.name ?? '',
              ),
            );
          case WordDetailStateStatus.error:
            hideLoader();
            Navigator.of(context).pushReplacementNamed('/not_found');
        }
      });
      controller.getWordDetails(widget.keyword);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    controller.previousWord();
                  },
                  child: Text(
                    'Voltar',
                    style:
                        context.textStyles.textSemiBold.copyWith(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    controller.goToNextWord();
                  },
                  child: Text(
                    'Próximo',
                    style:
                        context.textStyles.textSemiBold.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 10,
                  child: SizedBox(
                    height: context.percentHeight(0.5),
                    width: context.screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller.word?.name ?? '',
                          style: context.textStyles.textSemiBold
                              .copyWith(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(controller.word?.pronunciation ?? ''),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Significado',
                      style: context.textStyles.textExtraBold
                          .copyWith(fontSize: 24),
                      overflow: TextOverflow.ellipsis,
                    ),
                    controller.word?.isFavorited ?? false
                        ? InkWell(
                            onTap: () {
                              controller.updateWordUnfavorite(
                                controller.word?.name ?? '',
                              );
                            },
                            child: const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          )
                        : InkWell(
                            onTap: () async {
                              await controller.saveFavoriteWord(
                                controller.word,
                              );
                              controller.updateWordInStorage(
                                controller.word?.name ?? '',
                              );
                            },
                            child: const Icon(Icons.star_outline),
                          ),
                  ],
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      controller.word?.meaning ?? '',
                      style:
                          context.textStyles.textMedium.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
