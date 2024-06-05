import 'package:flutter/material.dart';

class QuizLanguageSelectionPage extends StatelessWidget {
  const QuizLanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = ['English', 'German', 'Italian', 'Spanish'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language for Quiz'),
        backgroundColor: const Color(0xFF4CAF50),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(top: 30), // Add padding to avoid overlapping with the back button
            itemCount: languages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(languages[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(language: languages[index]),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  final String language;

  const QuizPage({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, Object>>> languageQuestions = {
      'English': [
        {
          'questionText': 'What is the capital of the UK?',
          'answers': ['London', 'Paris', 'Berlin', 'Madrid'],
          'correctAnswer': 'London',
        },
        {
          'questionText': 'Which language is spoken in Australia?',
          'answers': ['English', 'German', 'Spanish', 'French'],
          'correctAnswer': 'English',
        },
        {
          'questionText': 'What is the largest planet in our solar system?',
          'answers': ['Earth', 'Mars', 'Jupiter', 'Saturn'],
          'correctAnswer': 'Jupiter',
        },
        {
          'questionText': 'Who wrote "Romeo and Juliet"?',
          'answers': ['Charles Dickens', 'William Shakespeare', 'Mark Twain', 'Jane Austen'],
          'correctAnswer': 'William Shakespeare',
        },
        {
          'questionText': 'What is the chemical symbol for water?',
          'answers': ['H2O', 'O2', 'CO2', 'NaCl'],
          'correctAnswer': 'H2O',
        },
      ],
      'German': [
        {
          'questionText': 'Was ist die Hauptstadt von Deutschland?',
          'answers': ['Berlin', 'Wien', 'Zürich', 'München'],
          'correctAnswer': 'Berlin',
        },
        {
          'questionText': 'Welche Sprache wird in Österreich hauptsächlich gesprochen?',
          'answers': ['Deutsch', 'Französisch', 'Italienisch', 'Niederländisch'],
          'correctAnswer': 'Deutsch',
        },
        {
          'questionText': 'Was ist der größte Planet in unserem Sonnensystem?',
          'answers': ['Erde', 'Mars', 'Jupiter', 'Saturn'],
          'correctAnswer': 'Jupiter',
        },
        {
          'questionText': 'Wer hat "Faust" geschrieben?',
          'answers': ['Johann Wolfgang von Goethe', 'Friedrich Schiller', 'Thomas Mann', 'Hermann Hesse'],
          'correctAnswer': 'Johann Wolfgang von Goethe',
        },
        {
          'questionText': 'Was ist das chemische Symbol für Wasser?',
          'answers': ['H2O', 'O2', 'CO2', 'NaCl'],
          'correctAnswer': 'H2O',
        },
      ],
      'Italian': [
        {
          'questionText': 'Qual è la capitale d\'Italia?',
          'answers': ['Roma', 'Milano', 'Napoli', 'Torino'],
          'correctAnswer': 'Roma',
        },
        {
          'questionText': 'Quale lingua si parla principalmente in Vaticano?',
          'answers': ['Italiano', 'Latino', 'Francese', 'Spagnolo'],
          'correctAnswer': 'Italiano',
        },
        {
          'questionText': 'Qual è il pianeta più grande del nostro sistema solare?',
          'answers': ['Terra', 'Marte', 'Giove', 'Saturno'],
          'correctAnswer': 'Giove',
        },
        {
          'questionText': 'Chi ha scritto "La Divina Commedia"?',
          'answers': ['Dante Alighieri', 'Giovanni Boccaccio', 'Francesco Petrarca', 'Ludovico Ariosto'],
          'correctAnswer': 'Dante Alighieri',
        },
        {
          'questionText': 'Qual è il simbolo chimico dell\'acqua?',
          'answers': ['H2O', 'O2', 'CO2', 'NaCl'],
          'correctAnswer': 'H2O',
        },
      ],
      'Spanish': [
        {
          'questionText': '¿Cuál es la capital de España?',
          'answers': ['Madrid', 'Barcelona', 'Sevilla', 'Valencia'],
          'correctAnswer': 'Madrid',
        },
        {
          'questionText': '¿Qué idioma se habla principalmente en Argentina?',
          'answers': ['Español', 'Portugués', 'Francés', 'Alemán'],
          'correctAnswer': 'Español',
        },
        {
          'questionText': '¿Cuál es el planeta más grande de nuestro sistema solar?',
          'answers': ['Tierra', 'Marte', 'Júpiter', 'Saturno'],
          'correctAnswer': 'Júpiter',
        },
        {
          'questionText': '¿Quién escribió "Don Quijote"?',
          'answers': ['Miguel de Cervantes', 'Gabriel García Márquez', 'Pablo Neruda', 'Jorge Luis Borges'],
          'correctAnswer': 'Miguel de Cervantes',
        },
        {
          'questionText': '¿Cuál es el símbolo químico del agua?',
          'answers': ['H2O', 'O2', 'CO2', 'NaCl'],
          'correctAnswer': 'H2O',
        },
      ],
    };

    final questions = languageQuestions[language] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('$language Quiz'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(top: 30), // Add padding to avoid overlapping with the back button
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return QuizQuestion(
                question: questions[index]['questionText'] as String,
                answers: questions[index]['answers'] as List<String>,
                correctAnswer: questions[index]['correctAnswer'] as String,
              );
            },
          ),
        ],
      ),
    );
  }
}

class QuizQuestion extends StatefulWidget {
  final String question;
  final List<String> answers;
  final String correctAnswer;

  const QuizQuestion({
    super.key,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  @override
  _QuizQuestionState createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  String? selectedAnswer;
  bool isAnswered = false;
  bool isCorrect = false;

  void answerQuestion(String answer) {
    setState(() {
      selectedAnswer = answer;
      isAnswered = true;
      isCorrect = answer == widget.correctAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.question,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...widget.answers.map((answer) {
              return ListTile(
                title: Text(answer),
                leading: Radio<String>(
                  value: answer,
                  groupValue: selectedAnswer,
                  onChanged: (value) {
                    if (!isAnswered) {
                      answerQuestion(value!);
                    }
                  },
                ),
              );
            }).toList(),
            if (isAnswered)
              Text(
                isCorrect ? 'Correct!' : 'Wrong! The correct answer is ${widget.correctAnswer}.',
                style: TextStyle(
                  color: isCorrect ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
