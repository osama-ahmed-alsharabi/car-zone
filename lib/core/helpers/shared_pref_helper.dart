import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static const String _onboardingKey = 'onboarding_shown';

  static Future<void> setOnboardingShown() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingKey, true);
  }

  static Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return !(prefs.getBool(_onboardingKey) ?? false);
  }
}
