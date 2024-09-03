import 'package:http/http.dart' as http;
import 'dart:convert';

class TranslationService {
  final String _baseUrl = 'https://4da9-223-185-131-254.ngrok-free.app'; // Your LibreTranslate URL

  Future<Map<String, String>> translate(String text, String targetLanguageCode) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/translate'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'q': text,
        'source': 'auto', // Auto-detect source language
        'target': targetLanguageCode,
        'format': 'text',
      }),
    );

    if (response.statusCode == 200) {
      // Decode the response body to ensure UTF-8 encoding
      final data = json.decode(utf8.decode(response.bodyBytes));

      // Since the API returns the translated text directly, we access it here
      return {
        'translated': data['translatedText'] ?? 'Translation error'
      };
    } else {
      throw Exception('Failed to translate text');
    }
  }
}
