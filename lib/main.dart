import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/translation_screen.dart';
import 'services/translation_service.dart';
import 'services/speech_recognition_service.dart';
import 'services/text_to_speech_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => TranslationService()),
        Provider(create: (_) => SpeechService()),
        Provider(create: (_) => TextToSpeechService()),
      ],
      child: MaterialApp(
        title: 'Phonexa',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TranslationScreen(),
      ),
    );
  }
}
