import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/respository/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo.loginApi(data).then((value) {
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}
