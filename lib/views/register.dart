import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../main.dart';
import '../models/userModel.dart';
import '../components/custom_alert.dart';
import '../utils/validators.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({super.key, required this.title});

  final String title;

  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  final UserModel _userModel = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color(0xFFE2F163),
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 2),
            const Text(
              'Let\'s Start!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFB3A0FF),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 2),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your name',
                      ),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (value) {
                        _name = value;
                      },
                      validator: validateName,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Email',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 2),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                      ),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (value) {
                        _email = value;
                      },
                      validator: validateEmail,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Password',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 2),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (value) {
                        _password = value;
                      },
                      validator: validatePassword,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Confirm Password',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 2),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                      ),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (value) {
                        _confirmPassword = value;
                      },
                      validator: (value) => validateConfirmPassword(value, _password),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'By continuing, you agree to',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                const Text.rich(
                  TextSpan(
                    text: 'Terms of Use',
                    style: TextStyle(color: Color(0xFFE2F163)),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: TextStyle(color: Color(0xFFE2F163)),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 178.56,
                height: 44,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool emailExists = await _userModel.isEmailRegistered(_email);
                      
                      if (emailExists) {
                        CustomAlert.show(context, 'Erro', 'Este e-mail já está registrado.');
                      } else {
                        _userModel.saveUserData(_name, _email, _password).then((_) {
                          CustomAlert.show(context, 'Sucesso', 'Usuário registrado com sucesso!').then((_) {
                            Navigator.pushNamed(context, '/');
                          });
                        });
                      }
                    }
                  },
                  child: const Text('Sign up'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "or sign up with",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svgs/google_icon.svg',
                  height: 50.0,
                  width: 50.0,
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  'assets/svgs/facebook_icon.svg',
                  height: 50.0,
                  width: 50.0,
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  'assets/svgs/finger_icon.svg',
                  height: 50.0,
                  width: 50.0,
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text.rich(
                TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Log in',
                      style: TextStyle(color: Color(0xFFE2F163)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}