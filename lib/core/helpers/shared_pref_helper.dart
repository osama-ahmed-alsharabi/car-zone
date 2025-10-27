import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  final SharedPreferences prefs;

  SharedPrefHelper(this.prefs);

  static const String _onboardingKey = 'onboarding_shown';

  Future<void> setOnboardingShown() async {
    await prefs.setBool(_onboardingKey, true);
  }

  bool isFirstTime() {
    return !(prefs.getBool(_onboardingKey) ?? false);
  }
}
