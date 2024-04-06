class MCQ {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  MCQ({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });

  factory MCQ.fromJson(Map<String, dynamic> json) {
    return MCQ(
      question: json['question'] as String,
      options: List<String>.from(json['options']),
      correctAnswerIndex: json['correctAnswerIndex'] as int,
    );
  }
}
