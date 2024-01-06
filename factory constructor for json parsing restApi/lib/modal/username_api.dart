class Username {

  final String title;
  final String first;
  final String last;

  Username({
    required this.title,
    required this.first,
    required this.last,

  });

  factory Username.fromMap(Map<String, dynamic> json) {
    return Username(
      title: json['title'],
      first: json['first'],
      last: json['last'],

    );
  }
}