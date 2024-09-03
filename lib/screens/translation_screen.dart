import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/speech_recognition_service.dart';
import '../services/translation_service.dart';
import '../services/text_to_speech_service.dart';
import '../widgets/translation_widget.dart';

class TranslationScreen extends StatefulWidget {
  @override
  _TranslationScreenState createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  late SpeechService _speechService;
  late TranslationService _translationService;
  late TextToSpeechService _textToSpeechService;

  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  Future<void> _initializeServices() async {
    _speechService = SpeechService();
    _translationService = TranslationService();
    _textToSpeechService = TextToSpeechService();

    try {
      await _speechService.init();
    } catch (e) {
      print('Error initializing speech service: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Translation')),
      body: TranslationWidget(
        speechService: _speechService,
        translationService: _translationService,
        textToSpeechService: _textToSpeechService,
      ),
    );
  }
}
