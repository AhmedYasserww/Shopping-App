import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserData({
  required String name,
  required String email,
  required String phoneNumber,
  required String password,
}) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('name', name);
  prefs.setString('email', email);
  prefs.setString('phoneNumber', phoneNumber);
  prefs.setString('password', password);
}
Future<Map<String, String?>> getUserData() async {
  final prefs = await SharedPreferences.getInstance();

  String? name = prefs.getString('name');
  String? email = prefs.getString('email');
  String? phoneNumber = prefs.getString('phoneNumber');
  String? password = prefs.getString('password');

  return {
    'name': name,
    'email': email,
    'phoneNumber': phoneNumber,
    'password': password,
  };
}