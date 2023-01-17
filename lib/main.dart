// ignore_for_file: prefer_const_constructors

// import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotesapp/view/login_view.dart';
import 'package:mynotesapp/view/notes_view.dart';
import 'package:mynotesapp/view/verify_email_view.dart';
import 'firebase_options.dart';
import 'package:mynotesapp/view/register_view.dart';

// import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:mynotesapp/view/landin_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/login': (context) => const LoginView(),
        '/register/': (context) => const RegisterView(),
      },
    ),
  );
}

enum MenuAction { logout }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance
                  .currentUser; // This is the part where email verification is tested for registered users
              if (user != null) {
                if (user.emailVerified) {
                  return const NotesView();
                } else {
                  return const VerifyEmailView();
                }
              } else {
                return const LoginView();
              }
              return Text('Done');
            default:
              return const CircularProgressIndicator();
          }
        });
  }
}
