import 'package:flutter/material.dart';
import '../services/speech_recognition_service.dart';
import '../services/translation_service.dart';
import '../services/text_to_speech_service.dart';
import '../utils/language_list.dart'; // Import your language list

class TranslationWidget extends StatefulWidget {
  final SpeechService speechService;
  final TranslationService translationService;
  final TextToSpeechService textToSpeechService;

  TranslationWidget({
    required this.speechService,
    required this.translationService,
    required this.textToSpeechService,
  });

  @override
  _TranslationWidgetState createState() => _TranslationWidgetState();
}

class _TranslationWidgetState extends State<TranslationWidget> {
  late SpeechService _speechService;
  late TranslationService _translationService;
  late TextToSpeechService _textToSpeechService;

  String _recognizedText = '';
  String _translatedText = '';
  String _selectedInputLanguageCode = 'en';
  String _selectedOutputLanguageCode = 'es';

  List<Language> languages = languageList;

  @override
  void initState() {
    super.initState();
    _speechService = widget.speechService;
    _translationService = widget.translationService;
    _textToSpeechService = widget.textToSpeechService;
  }

  Future<void> _startListening() async {
    String recognizedText = await _speechService.startListening();
    setState(() {
      _recognizedText = recognizedText;
    });
    _translateText();
  }

  Future<void> _translateText() async {
    try {
      final result = await _translationService.translate(_recognizedText, _selectedOutputLanguageCode);
      setState(() {
        _translatedText = result["translated"] ?? "Translation error";
      });
    } catch (e) {
      setState(() {
        _translatedText = "Error during translation";
      });
    }
  }

  Future<void> _speakTranslatedText() async {
    await _textToSpeechService.speak(_translatedText, _selectedOutputLanguageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Voice Translation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Input Language"),
            DropdownButton<String>(
              value: _selectedInputLanguageCode,
              items: languages.map((Language language) {
                return DropdownMenuItem<String>(
                  value: language.code,
                  child: Text(language.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedInputLanguageCode = value!;
                });
              },
            ),
            SizedBox(height: 16),
            Text("Select Output Language"),
            DropdownButton<String>(
              value: _selectedOutputLanguageCode,
              items: languages.map((Language language) {
                return DropdownMenuItem<String>(
                  value: language.code,
                  child: Text(language.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedOutputLanguageCode = value!;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _startListening,
              child: Text("Start Listening"),
            ),
            SizedBox(height: 16),
            Text("Recognized Text:"),
            Text(_recognizedText, style: TextStyle(fontFamily: _getFontFamily(_selectedInputLanguageCode))),
            SizedBox(height: 16),
            Text("Translated Text:"),
            Text(_translatedText, style: TextStyle(fontFamily: _getFontFamily(_selectedOutputLanguageCode))),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _speakTranslatedText,
              child: Text("Speak Translated Text"),
            ),
          ],
        ),
      ),
    );
  }

  String _getFontFamily(String languageCode) {
    // Return the appropriate font family based on the language code
    if (languageCode == 'ar') return 'NotoSansArabic';
    if (languageCode == 'he') return 'NotoSansHebrew';
    if (languageCode == 'hi') return 'NotoSansDevanagari';
    if (languageCode == 'ja' || languageCode == 'zh') return 'NotoSansTC';
    // Default to NotoSans for other languages
    return 'NotoSans';
  }
}
