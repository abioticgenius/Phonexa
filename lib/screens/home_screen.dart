import 'package:flutter/material.dart';
import 'package:phonexa_1/services/speech_recognition_service.dart'; // Adjust import if needed

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SpeechService _speechService = SpeechService();
  String _translatedText = '';

  @override
  void initState() {
    super.initState();
    // Initialize the service if needed
  }

  @override
  void dispose() {
    _speechService.stopListening();
    super.dispose();
  }

  void _startListening() {
    _speechService.startListening();
  }

  void _stopListening() {
    _speechService.stopListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phonexa - Voice Translation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: _startListening,
            child: Text('Start Listening'),
          ),
          ElevatedButton(
            onPressed: _stopListening,
            child: Text('Stop Listening'),
          ),
          SizedBox(height: 20),
          Text(
            'Translated Text:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            _translatedText,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
