import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class KamusPage extends StatefulWidget {
  const KamusPage({Key? key}) : super(key: key);

  @override
  _KamusPageState createState() => _KamusPageState();
}

class _KamusPageState extends State<KamusPage> {
  late Future<Translation> futureTranslation;

  @override
  void initState() {
    super.initState();
    futureTranslation = fetchTranslation();
  }

  Future<Translation> fetchTranslation() async {
    final response = await http.get(Uri.parse('http://localhost:3000/translations'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Translation.fromJson(data);
    } else {
      throw Exception('Failed to load translation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kamus'),
      ),
      body: FutureBuilder<Translation>(
        future: futureTranslation,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final translation = snapshot.data!;
            return ListTile(
              title: Text('Source: ${translation.sourceLanguage} - Target: ${translation.targetLanguage}'),
              subtitle: Text('Source text: ${translation.sourceText} - Translated text: ${translation.translatedText}'),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

class Translation {
  final String sourceLanguage;
  final String targetLanguage;
  final String sourceText;
  final String translatedText;

  Translation({
    required this.sourceLanguage,
    required this.targetLanguage,
    required this.sourceText,
    required this.translatedText,
  });

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      sourceLanguage: json['source_language'],
      targetLanguage: json['target_language'],
      sourceText: json['source_text'],
      translatedText: json['translated_text'],
    );
  }
}
