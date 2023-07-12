import 'package:flutter/material.dart';
import 'package:mobile_challenge/app/core/config/locator.dart';
import 'package:mobile_challenge/app/core/helpers/loader.dart';
import 'package:mobile_challenge/app/core/helpers/messages.dart';
import 'package:mobile_challenge/app/modules/words_list/word_list_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class WordListPage extends StatefulWidget {
  const WordListPage({super.key});

  @override
  State<WordListPage> createState() => _WordListPageState();
}

class _WordListPageState extends State<WordListPage> with Loader, Messages {
  final controller = getIt.get<WordListController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reaction((_) => controller.status, (status) {
        switch (status) {
          case WordListStateStatus.initial:
            break;
          case WordListStateStatus.loading:
            showLoader();
            break;
          case WordListStateStatus.sucess:
            hideLoader();
            break;
          case WordListStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro ao buscar lista');
        }
      });
      controller.loadWordsList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word List'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: Observer(
              builder: (_) {
                return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final word = controller.wordsList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/word_detail',
                            arguments: word,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.5),
                          ),
                          child: Center(child: Text(word)),
                        ),
                      );
                    },
                    childCount: controller.wordsList.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 100,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
