class Question {
  final String question;
  final String correctAnswer;
  final List<String> allOptions;

  Question({
    required this.question,
    required this.correctAnswer,
    required this.allOptions,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    List<String> allOptions = List<String>.from(json['incorrect_answers']);
    allOptions.add(json['correct_answer']);
    allOptions.shuffle(); // So correct answer isn't always last
    
    return Question(
      question: json['question'],
      correctAnswer: json['correct_answer'],
      allOptions: allOptions,
    );
  }
}