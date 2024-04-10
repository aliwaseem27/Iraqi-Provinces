import 'package:get/get.dart';

class StartExamController extends GetxController{
  static StartExamController get instance => Get.find();

  final numberOfQuestions = 10.obs;

  void chooseNumberOfQuestions(int number){
    numberOfQuestions.value = number;
  }
}