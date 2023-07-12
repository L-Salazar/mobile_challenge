import 'package:flutter/material.dart';
import 'package:mobile_challenge/app/core/ui/styles/app_text_styles.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Palavra não encontrada'),
      ),
      body: Center(
        child: Text(
          'Ocorreu um erro ao \nbuscar a palavra selecionada.',
          textAlign: TextAlign.center,
          style: context.textStyles.textBold.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}
