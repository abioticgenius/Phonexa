import 'package:flutter/material.dart';

class TranslateButton extends StatelessWidget {
  final VoidCallback onTranslate;

  const TranslateButton({required this.onTranslate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTranslate,
      child: const Text('Translate'),
    );
  }
}
