import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  AddQuizState createState() => AddQuizState();
}

class AddQuizState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int? _selectedAnswer;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'answers': ['Paris', 'London', 'Berlin', 'Madrid'],
      'correctIndex': 0,
    },
    {
      'question': 'Who painted the Mona Lisa?',
      'answers': [
        'Vincent Van Gogh',
        'Pablo Picasso',
        'Leonardo da Vinci',
        'Michelangelo'
      ],
      'correctIndex': 2,
    },
    {
      'question': 'What is the smallest country in the world?',
      'answers': ['Vatican City', 'Monaco', 'Nauru', 'Liechtenstein'],
      'correctIndex': 0,
    },
  ];

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = null; // Reset selected answer for the next question
      });
    } else {
      // Quiz finished logic
      print('Quiz Finished');
      // Implement your logic here, like showing a dialog or navigating to a result page
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}/${_questions.length}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              currentQuestion['question'],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: currentQuestion['answers'].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(currentQuestion['answers'][index]),
                    leading: Radio<int>(
                      value: index,
                      groupValue: _selectedAnswer,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedAnswer = value;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _nextQuestion,
              child: Text(_currentQuestionIndex < _questions.length - 1
                  ? 'Next Question'
                  : 'Finish Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
