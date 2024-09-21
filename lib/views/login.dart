import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/userModel.dart';
import '../utils/validators.dart';
import '../components/custom_alert.dart';

class MyHomePageState extends StatefulWidget {
  const MyHomePageState({super.key, required this.title});

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageState> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                children: const [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(25),
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
                      'Email',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 5),
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
                    const SizedBox(height: 5),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter your Password',
                      ),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (value) {
                        _password = value;
                      },
                      validator: validatePassword,
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgot-password');
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 178.56,
                height: 44,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool loginSuccess = await _userModel.loginUser(_email, _password);
                      if (loginSuccess) {
                        CustomAlert.show(context, 'Sucesso', 'Login realizado com sucesso!');
                      } else {
                        CustomAlert.show(context, 'Erro', 'Email ou senha inválidos!');
                      }
                    }
                  },
                  child: const Text('Log in'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                const Text(
                  'or sign up with',
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
              ],
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              
              child: const Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign Up',
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