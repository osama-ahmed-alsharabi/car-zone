import 'package:car_zone/core/database/app_database.dart';
import 'package:car_zone/features/home/data/model/brand_model.dart';
import 'package:sqflite/sqflite.dart';

class BrandLocalDataSource {
  final dbProvider = AppDatabase();
  Future<void> cacheBrands(List<BrandModel> brands) async {
    final db = await dbProvider.database;

    await db.delete('brands');

    for (var brand in brands) {
      await db.insert(
        'brands',
        {
          'id': brand.id,
          'name': brand.name,
          'is_active': brand.isActive,
          'deleted_at': brand.deletedAt?.toIso8601String(),
          'created_at': brand.createdAt?.toIso8601String(),
          'updated_at': brand.updatedAt?.toIso8601String(),
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<BrandModel>> getCachedBrands() async {
    final db = await dbProvider.database;
    final data = await db.query('brands');

    return data.map((e) {
      return BrandModel(
        id: e['id'] as int,
        name: e['name'] as String,
        isActive: e['is_active'] as int,
        deletedAt: e['deleted_at'] != null
            ? DateTime.tryParse(e['deleted_at'] as String)
            : null,
        createdAt: e['created_at'] != null
            ? DateTime.tryParse(e['created_at'] as String)
            : null,
        updatedAt: e['updated_at'] != null
            ? DateTime.tryParse(e['updated_at'] as String)
            : null,
      );
    }).toList();
  }
}
