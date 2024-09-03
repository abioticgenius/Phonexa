import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveTranslation(String original, String translated) async {
    await _firestore.collection('translations').add({
      'original': original,
      'translated': translated,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
