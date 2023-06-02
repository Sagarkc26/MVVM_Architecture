import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/respository/auth_repository.dart';
import 'package:mvvm_architecture/utils/routes/routeName.dart';
import 'package:mvvm_architecture/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signloading = false;
  bool get signloading => _signloading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setsignUpLoading(bool value) {
    _signloading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushErrorMessage("Login Successful", context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushErrorMessage(error.toString(), context);
    });
  }

  Future<void> singUpApi(dynamic data, BuildContext context) async {
    setsignUpLoading(true);
    _myRepo.loginApi(data).then((value) {
      setsignUpLoading(false);
      Utils.flushErrorMessage("Signup Successful", context);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setsignUpLoading(false);
      Utils.flushErrorMessage(error.toString(), context);
    });
  }
}
