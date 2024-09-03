import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

  Future<void> init() async {
    bool available = await _speech.initialize();
    if (!available) {
      throw Exception('Speech recognition not available');
    }
  }

  Future<String> startListening() async {
    if (_isListening) {
      _speech.stop();
      _isListening = false;
      return '';
    }

    _isListening = true;
    String recognizedText = '';

    _speech.listen(onResult: (result) {
      if (result.finalResult) {
        recognizedText = result.recognizedWords;
        _speech.stop();
        _isListening = false;
      }
    });

    // Return the recognized text once the listening is stopped
    await Future.delayed(Duration(seconds: 5));
    return recognizedText;
  }
}
