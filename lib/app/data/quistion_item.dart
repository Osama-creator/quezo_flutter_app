class Question {
  final String id;
  final String rightAnswer;
  String? userChoice;
  final String? question;
  final List<String>? options;
  final String? image;
  final List<String>? wrongImages;

  Question(
      {required this.id,
      required this.rightAnswer,
      this.question,
      this.userChoice,
      this.options,
      this.image,
      this.wrongImages});
}
