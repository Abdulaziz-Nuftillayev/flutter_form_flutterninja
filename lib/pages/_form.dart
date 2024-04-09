import 'package:flutter/material.dart';

class FormValidate extends StatefulWidget {
  const FormValidate({super.key});

  @override
  State<FormValidate> createState() => _FormValidateState();
}

class _FormValidateState extends State<FormValidate> {
  final LoginData _loginData = LoginData();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation in Flutter | @FlutterNinja'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (String? inValue) {
                  if (inValue!.isEmpty) {
                    return "Please enter userName!";
                  }
                  return null;
                },
                onSaved: (String? inValue) {
                  _loginData.username = inValue!;
                },
                decoration: const InputDecoration(
                  hintText: "example@.gmai",
                  labelText: "Username (eMail address)",
                ),
              ),
              TextFormField(
                validator: (String? inValue) {
                  if (inValue!.length < 10) {
                    return "Password must be >= 10 in length!";
                  }
                  return null;
                },
                onSaved: (String? inValue) {
                  _loginData.password = inValue!;
                },
                decoration: const InputDecoration(
                    hintText: "Password", labelText: "Password"),
              ),
              MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print("Username: ${_loginData.username}");
                    print("Password: ${_loginData.password}");
                  }
                },
                child: const Text('Click me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginData {
  String username = " ";
  String password = " ";
}
