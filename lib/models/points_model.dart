class PointsModel {
  final int totalPoints;
  final double cashEquivalent;

  PointsModel({
    required this.totalPoints,
    required this.cashEquivalent,
  });

  factory PointsModel.fromJson(Map<String, dynamic> json) {
    return PointsModel(
      totalPoints: json['totalPoints'],
      cashEquivalent: json['cashEquivalent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalPoints': totalPoints,
      'cashEquivalent': cashEquivalent,
    };
  }
}
