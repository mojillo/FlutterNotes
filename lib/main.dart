// ignore_for_file: prefer_const_constructors

// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mynotesapp/constants/routes.dart';
import 'package:mynotesapp/services/auth/auth_service.dart';
import 'package:mynotesapp/view/login_view.dart';
import 'package:mynotesapp/view/notes/new_notes_view.dart';
import 'package:mynotesapp/view/notes/notes_view.dart';
import 'package:mynotesapp/view/verify_email_view.dart';
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
        loginRoute: (context) => const LoginView(),
        registeredRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NotesView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        newNotesRoute: (context) => const NewNotesView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthService.firebase().initialize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = AuthService.firebase()
                  .currentUser; // This is the part where email verification is tested for registered users
              if (user != null) {
                if (user.isEmailVerified) {
                  return const NotesView();
                } else {
                  return const VerifyEmailView();
                }
              } else {
                return const LoginView();
              }
            default:
              return const CircularProgressIndicator();
          }
        });
  }
}
