class ProfileModel {
  final String userName;
  final String email;
  final String profileImageUrl;

  ProfileModel({
    required this.userName,
    required this.email,
    required this.profileImageUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      userName: json['userName'],
      email: json['email'],
      profileImageUrl: json['profileImageUrl'],
    );
  }
}
