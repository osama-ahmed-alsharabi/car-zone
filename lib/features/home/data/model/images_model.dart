class ImagesModel {
  final String mainImage;
  final String? subImage;

  ImagesModel({required this.mainImage,  this.subImage});

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    return ImagesModel(
      mainImage: json['main_image'] ?? '',
      subImage: json['sub_image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'main_image': mainImage, 'sub_image': subImage};
  }
}
