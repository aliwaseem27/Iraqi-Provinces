import 'package:Iraq/features/exam/models/mcq.dart';
import 'package:get/get.dart';

class ExamRepository extends GetxController {
  static ExamRepository get instance => Get.find();

  final List<MCQ> _questions = [
    MCQ(
      question: "What is Flutter?",
      options: ["A bird", "A web framework", "A mobile SDK", "None of the above"],
      correctAnswerIndex: 2,
    ),
    MCQ(
      question: "What is Flutter2?",
      options: ["A bird", "A web framework", "A mobile SDK", "None of the above"],
      correctAnswerIndex: 2,
    ),
    MCQ(
      question: "What is Flutter2?",
      options: ["A bird", "A web framework", "A mobile SDK", "None of the above"],
      correctAnswerIndex: 2,
    ),
    MCQ(
      question: "What is Flutter2?",
      options: ["A bird", "A web framework", "A mobile SDK", "None of the above"],
      correctAnswerIndex: 2,
    ),
    MCQ(
      question: "What is Flutter2?",
      options: ["A bird", "A web framework", "A mobile SDK", "None of the above"],
      correctAnswerIndex: 2,
    ),
    MCQ(
      question: "What is Flutter2?",
      options: ["A bird", "A web framework", "A mobile SDK", "None of the above"],
      correctAnswerIndex: 2,
    ),
  ];

  List<MCQ> get questions => _questions;
}
