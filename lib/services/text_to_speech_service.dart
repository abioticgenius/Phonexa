import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechService {
  late FlutterTts _flutterTts;

  TextToSpeechService() {
    _flutterTts = FlutterTts();
    _setupTts();
  }

  void _setupTts() async {
    // Set default TTS options
    await _flutterTts.setLanguage('en-US'); // Default language
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);
  }

  Future<void> speak(String text, String languageCode) async {
    String ttsLanguageCode = _mapLanguageCode(languageCode);
    await _flutterTts.setLanguage(ttsLanguageCode); // Set the language for TTS
    await _flutterTts.speak(text);
  }

  String _mapLanguageCode(String languageCode) {
    // Map general language codes to specific TTS engine codes
    switch (languageCode) {
      case 'hi': // Hindi
        return 'hi-IN';
      case 'es': // Spanish
        return 'es-ES';
      case 'zh': // Chinese
        return 'zh-CN';
      case 'ja': // Japanese
        return 'ja-JP';
      case 'fr': // French
        return 'fr-FR';
      case 'de': // German
        return 'de-DE';
    // Add more language mappings here as needed
      default:
        return 'en-US'; // Default to English
    }
  }
}
