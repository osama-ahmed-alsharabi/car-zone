import 'package:car_zone/core/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class UserDao {
  final dbProvider = AppDatabase();

  Future<void> insertUser(UserModel user) async {
    final db = await dbProvider.database;
    await db.insert('user', {
      'id': user.id,
      'fullName': user.fullName,
      'email': user.email,
      'phoneNumber': user.phoneNumber,
      'googleId': user.googleId,
      'emailVerifiedAt': user.emailVerifiedAt?.toIso8601String(),
      'createdAt': user.createdAt?.toIso8601String(),
      'updatedAt': user.updatedAt?.toIso8601String(),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<UserModel?> getUser() async {
    final db = await dbProvider.database;
    final result = await db.query('user', limit: 1);
    if (result.isNotEmpty) {
      final data = result.first;
      return UserModel(
        id: data['id'] as String?,
        fullName: data['fullName'] as String?,
        email: data['email'] as String,
        phoneNumber: data['phoneNumber'] as String,
        googleId: data['googleId'] as String?,
        emailVerifiedAt: data['emailVerifiedAt'] != null
            ? DateTime.parse(data['emailVerifiedAt'] as String)
            : null,
        createdAt: data['createdAt'] != null
            ? DateTime.parse(data['createdAt'] as String)
            : null,
        updatedAt: data['updatedAt'] != null
            ? DateTime.parse(data['updatedAt'] as String)
            : null,
      );
    }
    return null;
  }

  Future<void> deleteUser() async {
    final db = await dbProvider.database;
    await db.delete('user');
  }
}
