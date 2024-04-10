import 'package:Iraq/data/repositories/exam_repository.dart';
import 'package:Iraq/features/exam/controllers/start_exam_controller.dart';
import 'package:Iraq/features/exam/models/mcq.dart';
import 'package:Iraq/features/exam/screens/results/results.dart';
import 'package:get/get.dart';

class ExamController extends GetxController{
  static ExamController get instance => Get.find();

  final ExamRepository examRepository = ExamRepository.instance;

  final currentQuestionIndex = 0.obs;
  final selectedOptionIndex = (-1).obs;
  final score = 0.obs;
  final questions = <MCQ>[].obs;
  final wrongAnswers = [];

  @override
  void onInit() {
    super.onInit();
    prepareQuestions();
  }

  void prepareQuestions(){
    final List<MCQ> originalQuestions = List.from(examRepository.questions);
    final numElements = StartExamController.instance.numberOfQuestions.value;
    if (numElements <= originalQuestions.length){
      originalQuestions.shuffle();
      questions.assignAll(originalQuestions.sublist(0, numElements));
    } else {
      originalQuestions.shuffle();
      questions.assignAll(originalQuestions);
    }
  }

  void selectOption(int index) {
    selectedOptionIndex.value = index;
  }

  void increaseScore(){
    if (isAnswerCorrect()) {
      score.value++;
    } else {
      wrongAnswers.add(currentQuestionIndex.value);
    }
  }


  void nextQuestion() {
    increaseScore();

    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      selectedOptionIndex.value = -1; // Reset for next question
    } else {
      Get.to(()=> const ResultsScreen());
    }
  }

  String getQuestionText() {
    return questions[currentQuestionIndex.value].question;
  }

  List<String> getCurrentOptions() {
    return questions[currentQuestionIndex.value].options;
  }

  bool isAnswerCorrect() {
    return selectedOptionIndex.value == questions[currentQuestionIndex.value].correctAnswerIndex;
  }

  // Reset the quiz to start over
  void resetQuiz() {
    currentQuestionIndex.value = 0;
    selectedOptionIndex.value = -1;
    score.value = 0;
  }

  // Check if the quiz has ended
  bool isQuizCompleted() {
    return currentQuestionIndex.value >= questions.length - 1;
  }
}