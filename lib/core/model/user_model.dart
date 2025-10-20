class UserModel {
  final String? id;
  final String? fullName;
  final String email;
  final String? password;
  final String? googleId;
  final String? phoneNumber;
  final DateTime? emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel({
    this.id,
    this.fullName,
    required this.email,
    this.password,
    this.googleId,
    this.phoneNumber,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"]?.toString(),
      fullName: json["name"],
      email: json["email"],
      password: json["password"],
      googleId: json["google_id"],
      phoneNumber: json["phone"],
      emailVerifiedAt: json["email_verified_at"] != null
          ? DateTime.parse(json["email_verified_at"])
          : null,
      createdAt: json["created_at"] != null
          ? DateTime.parse(json["created_at"])
          : null,
      updatedAt: json["updated_at"] != null
          ? DateTime.parse(json["updated_at"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": fullName,
      "email": email,
      "password": password,
      "phone": phoneNumber,
      "google_id": googleId,
      "email_verified_at": emailVerifiedAt?.toIso8601String(),
      "created_at": createdAt?.toIso8601String(),
      "updated_at": updatedAt?.toIso8601String(),
    };
  }
}
