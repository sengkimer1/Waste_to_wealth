class PointsModel {
  final String totalPoints;
  final String cashEquivalent;

  PointsModel({
    required this.totalPoints,
    required this.cashEquivalent,
  });

  factory PointsModel.fromJson(Map<String, dynamic> json) {
    return PointsModel(
      totalPoints: json['totalPoints'].toString(), 
      cashEquivalent: json['cashEquivalent'].toString(), // Convert int to String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalPoints': totalPoints,
      'cashEquivalent': cashEquivalent,
    };
  }
}
