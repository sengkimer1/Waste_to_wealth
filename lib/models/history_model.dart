class HistoryModel {
  final int pickupId;
  final String date;
  final List<String> wasteTypes;
  final double estimateWeight;
  final String status;
  final String userId;
  final String? createdAt;

  HistoryModel({
    required this.pickupId,
    required this.date,
    required this.wasteTypes,
    required this.estimateWeight,
    required this.status,
    required this.userId,
    this.createdAt,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      pickupId: json['pickupId'] ?? 0,
      date: json['date'] ?? '',
      wasteTypes: (json['wasteTypes'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      estimateWeight: (json['estimateWeight'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] ?? '',
      userId: json['userId'] ?? '',
    );
  }
}
