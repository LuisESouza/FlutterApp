import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  Future<void> saveUserData(String name, String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('userEmail', email);
    await prefs.setString('password', password);
  }

  Future<void> updateUserData(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', password);
  }

  Future<bool> loginUser(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('userEmail');
    String? savedPassword = prefs.getString('password');

    if (savedEmail == email && savedPassword == password) {
      return true;
    }
    return false;
  }

  Future<bool> isEmailRegistered(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('userEmail');
    
    return savedEmail == email;
  }
}