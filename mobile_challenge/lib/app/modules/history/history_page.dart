import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_challenge/app/core/config/locator.dart';
import 'package:mobile_challenge/app/core/helpers/loader.dart';
import 'package:mobile_challenge/app/core/helpers/messages.dart';
import 'package:mobile_challenge/app/core/ui/styles/app_text_styles.dart';
import 'package:mobile_challenge/app/models/word.dart';
import 'package:mobile_challenge/app/modules/history/history_controller.dart';
import 'package:mobx/mobx.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with Loader, Messages {
  final controller = getIt.get<HistoryController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reaction((_) => controller.status, (status) {
        switch (status) {
          case HistoryStateStatus.initial:
            break;
          case HistoryStateStatus.loading:
            showLoader();
            break;
          case HistoryStateStatus.sucess:
            hideLoader();
            break;
          case HistoryStateStatus.error:
            hideLoader();
            showError('Erro ao buscar histórico de palavras');
        }
      });
      controller.getHistoryWords();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Page'),
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.wordsFromHistory.length,
            itemBuilder: (context, index) {
              final word = controller.wordsFromHistory[index] as Word;
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
