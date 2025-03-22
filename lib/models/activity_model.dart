class Activity {
  final String estimateWeight;
  final String title;
  final String points;
  final DateTime date;

  Activity({
    required this.estimateWeight,
    required this.title,
    required this.points,
    required this.date,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      estimateWeight: json['estimateWeight']?.toString() ?? '', 
      title: json['title'] ?? '',
      points: json['points']?.toString() ?? '', 
      date: json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'estimateWeight': estimateWeight,
      'title': title,
      'points': points,
      'date': date.toIso8601String(),
    };
  }
}
