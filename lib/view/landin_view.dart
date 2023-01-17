// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LandinView extends StatelessWidget {
  const LandinView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.teal,
            body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                      0.1,
                      0.4,
                      0.6,
                      0.9,
                    ],
                        colors: [
                      Color.fromRGBO(29, 83, 129, 1),
                      Color.fromRGBO(37, 53, 102, 1),
                      Color.fromRGBO(38, 29, 82, 1),
                      Color.fromRGBO(39, 16, 70, 1),
                    ])),
                child: SafeArea(
                    child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 90, 8, 120),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'DIGITM',
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 78,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 230,
                    height: 2,
                    child: Divider(color: Colors.white24),
                  ),
                  Card(
                    color: Colors.transparent,
                    margin:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 55),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.email,
                          color: Color.fromARGB(90, 255, 255, 255),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          ' Email   ',
                          style: TextStyle(
                            color: Color.fromARGB(90, 255, 255, 255),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 230,
                    height: 2,
                    child: Divider(color: Colors.white24),
                  ),
                  Card(
                    color: Colors.transparent,
                    margin:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 55),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.password,
                          color: Color.fromARGB(90, 255, 255, 255),
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                            color: Color.fromARGB(92, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                    color: Colors.lightBlue,
                    margin:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 55),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.lock,
                          color: Color.fromARGB(92, 255, 255, 255),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Secured Login ',
                          style: TextStyle(
                            color: Color.fromARGB(213, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                    color: Colors.transparent,
                    margin:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 55),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 11,
                        ),
                        Text(
                          "Don't have an account ?  ",
                          style: TextStyle(
                            color: Color.fromARGB(92, 255, 255, 255),
                          ),
                        ),
                        Text(
                          'Sign up Now!',
                          style: TextStyle(color: Colors.lightBlue),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Row(
                    children: const [
                      Expanded(
                          child: Divider(
                        color: Colors.white,
                      )),
                      Text(
                        'OR',
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.white,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Sign in with Social Networks',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInButton(
                        Buttons.Facebook,
                        onPressed: () {},
                        mini: true,
                        // text: 'Facebook',
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      SignInButton(Buttons.Google, onPressed: () {}),
                    ],
                  ),
                ])))));
  }
}
