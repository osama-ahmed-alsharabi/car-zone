import 'package:car_zone/core/utils/assets.dart';

class BrandModel {
  final int id;
  final String name;
  List<String> image = [
    AppAssets.imagesToyotaLogo,
    AppAssets.imagesMercedesLogo,
    AppAssets.imagesHondaLogo,
    AppAssets.imagesHyundaiLogo,
  ];
  final int isActive;
  final DateTime deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  BrandModel({
    required this.id,
    required this.name,
    required this.isActive,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json["id"],
      name: json["name"],
      isActive: json["is_active"],
      deletedAt: json["deleted_at"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }
}
