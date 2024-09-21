import 'package:flutter/material.dart';
import '../models/userModel.dart';
import '../components/custom_alert.dart';
import '../utils/validators.dart';

class MySetPasswordPage extends StatefulWidget {
  const MySetPasswordPage({super.key, required this.title});

  final String title;

  @override
  _MySetPasswordPageState createState() => _MySetPasswordPageState();
}

class _MySetPasswordPageState extends State<MySetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  String _newPassword = '';
  String _confirmPassword = '';
  final UserModel userModel = UserModel();

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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(25),
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: Color(0xFFB3A0FF),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Password',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'password',
                      ),
                      onChanged: (value) {
                        _newPassword = value;
                      },
                      validator: validatePassword,
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Confirm Password',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'password',
                      ),
                      onChanged: (value) {
                        _confirmPassword = value;
                      },
                      validator: (value) => validateConfirmPassword(value, _newPassword),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
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
                        await userModel.updateUserData(_newPassword);
                        await CustomAlert.show(context,'Sucesso','Senha alterada com sucesso!').then((_){
                          Navigator.pushNamed(context, '/');
                        });
                      } else {
                        await CustomAlert.show(context,'Erro','Verifique os campos e tente novamente.',);
                      }
                    },
                    child: const Text('Reset Password'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}