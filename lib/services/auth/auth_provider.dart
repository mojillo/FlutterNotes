// This provides a universal auth provider for all the types of authentication services
//we will provide a getter and setter for this purpose

import 'package:mynotesapp/services/auth/auth_user.dart';

abstract class Authprovider {
  Future<void> initialize();
  AuthUser? get currentUser;
  Future<AuthUser> logIn({
    required String email,
    required String password,
  });
  Future<AuthUser> createUser({
    // this enables a custom module for making a new user
    required String email,
    required String password,
  });
  Future<void> logOut();
  Future<void> sendEmailVerification();
}
