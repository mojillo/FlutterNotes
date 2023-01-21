import 'package:flutter/material.dart';
import 'package:mynotesapp/constants/routes.dart';
import 'package:mynotesapp/services/auth/auth_exceptions.dart';
import 'package:mynotesapp/services/auth/auth_service.dart';
import 'package:mynotesapp/utilities/show_error_dia.dart';
// import '../firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Enter Email Here',
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: 'Enter Password Here',
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                await AuthService.firebase().createUser(
                  email: email,
                  password: password,
                );
                AuthService.firebase().sendEmailVerification();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushNamed(verifyEmailRoute);
              } on WeakPasswordAuthException {
                await showErrorDialog(
                  context,
                  'weak-password',
                );
              } on EmailAlreadyInUseAuthException {
                await showErrorDialog(
                  context,
                  'email-already-in-use',
                );
              } on InvalidEmailAuthException {
                await showErrorDialog(
                  context,
                  'invalid-email',
                );
              } on GenericAuthException {
                await showErrorDialog(
                  context,
                  'failed to register',
                );
              }
            },
            child: const Text('Register'),
          ),
          TextButton(
            onPressed: (() {
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute,
                (route) => false,
              );
            }),
            child: const Text('Already Registered ? Login here !'),
          )
        ],
      ),
    );
  }
}
