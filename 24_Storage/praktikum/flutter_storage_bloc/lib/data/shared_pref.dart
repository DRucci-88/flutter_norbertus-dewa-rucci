import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  final Future<SharedPreferences> sharedPref;

  SharedPref({required this.sharedPref});

  static const String nameKey = 'nameKey';
  static const String emailKey = 'emailKey';
  static const String phoneNumberKey = 'phoneNumberKey';
  static const String isLoginKey = 'isLoginKey';

  // GETTER
  Future<String?> getName() async => (await sharedPref).getString(nameKey);
  Future<String?> geEmail() async => (await sharedPref).getString(emailKey);
  Future<String?> getPhoneNumber() async =>
      (await sharedPref).getString(phoneNumberKey);
  Future<bool?> getIsLoginKey() async => (await sharedPref).getBool(isLoginKey);

  // SETTER
  setName(String value) async {
    (await sharedPref).setString(nameKey, value);
  }

  setEmail(String value) async {
    (await sharedPref).setString(emailKey, value);
  }

  setPhoneNumber(String value) async {
    (await sharedPref).setString(phoneNumberKey, value);
  }

  setIsLogin(bool value) async {
    (await sharedPref).setBool(isLoginKey, value);
  }

  clearAllData() async {
    await (await sharedPref).clear();
  }
}
