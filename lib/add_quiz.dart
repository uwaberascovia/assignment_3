// import 'package:flutter/material.dart';

// class AddQuiz extends StatefulWidget {
//   const AddQuiz({Key? key}) : super(key: key);

//   @override
//   State<AddQuiz> createState() => _AddQuizState();
// }

// class _AddQuizState extends State<AddQuiz> {
//   // A list to hold the questions and their answers
//   List<Map<String, dynamic>> questions = [];

//   // Controllers for the question and answer TextFields
//   final TextEditingController questionController = TextEditingController();
//   final List<TextEditingController> answerControllers = [];

//   @override
//   void dispose() {
//     // Dispose the controllers when the widget is removed from the widget tree
//     questionController.dispose();
//     for (var controller in answerControllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   void addQuestion() {
//     // Add a new question with empty answers to the list
//     questions.add({
//       'question': questionController.text,
//       'answers': List.generate(4, (_) => ''), // Assume 4 answers per question
//       'correctIndex': 0, // Default correct answer index
//     });

//     // Clear the question text field
//     questionController.clear();

//     // Add new controllers for the answers of the new question
//     answerControllers.addAll(List.generate(4, (_) => TextEditingController()));

//     setState(() {});
//   }

//   void saveQuestion(int index) {
//     // Update the answers of the question at the given index
//     for (int i = 0; i < 4; i++) {
//       questions[index]['answers'][i] = answerControllers[index * 4 + i].text;
//     }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Quiz'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: questionController,
//                 decoration: const InputDecoration(
//                   labelText: 'Enter your question here',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: addQuestion,
//               child: const Text('Add Question'),
//             ),
//             const Divider(),
//             ListView.builder(
//               shrinkWrap: true,
//               physics:
//                   NeverScrollableScrollPhysics(), // to avoid scrolling within a scroll
//               itemCount: questions.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Question ${index + 1}: ${questions[index]['question']}',
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         ...List.generate(
//                             4,
//                             (i) => TextField(
//                                   controller: answerControllers[index * 4 + i],
//                                   decoration: InputDecoration(
//                                     labelText: 'Answer ${i + 1}',
//                                     border: OutlineInputBorder(),
//                                   ),
//                                 )),
//                         ElevatedButton(
//                           onPressed: () => saveQuestion(index),
//                           child: const Text('Save Question'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: AddQuiz()));
}

class AddQuiz extends StatefulWidget {
  const AddQuiz({Key? key}) : super(key: key);

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  final List<Question> questions = [];
  final TextEditingController questionController = TextEditingController();

  void addQuestion() {
    final question = Question(
        question: questionController.text,
        correctAnswerIndex: 0,
        answers: List.generate(4, (_) => ''));
    setState(() {
      questions.add(question);
    });
    questionController.clear();
  }

  @override
  void dispose() {
    questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Quiz'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: questionController,
                decoration: const InputDecoration(
                  labelText: 'Enter your question here',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: addQuestion,
              child: const Text('Add Question'),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // to avoid scrolling within a scroll
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return QuestionCard(
                  question: questions[index],
                  onChangedAnswer: (String value, int answerIndex) {
                    setState(() {
                      questions[index].answers[answerIndex] = value;
                    });
                  },
                  onChangedCorrectAnswer: (int? value) {
                    setState(() {
                      questions[index].correctAnswerIndex = value!;
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  String question;
  List<String> answers;
  int correctAnswerIndex;

  Question(
      {required this.question,
      required this.answers,
      required this.correctAnswerIndex});
}

class QuestionCard extends StatelessWidget {
  final Question question;
  final Function(String, int) onChangedAnswer;
  final Function(int?) onChangedCorrectAnswer;

  const QuestionCard(
      {Key? key,
      required this.question,
      required this.onChangedAnswer,
      required this.onChangedCorrectAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            ...List.generate(
                4,
                (index) => TextFormField(
                      initialValue: question.answers[index],
                      decoration:
                          InputDecoration(labelText: 'Answer ${index + 1}'),
                      onChanged: (value) => onChangedAnswer(value, index),
                    )),
            for (int i = 0; i < 4; i++)
              RadioListTile<int>(
                title: Text('Answer ${i + 1}'),
                value: i,
                groupValue: question.correctAnswerIndex,
                onChanged: onChangedCorrectAnswer,
              ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Save Question'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
