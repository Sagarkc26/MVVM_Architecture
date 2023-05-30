import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/routes/routeName.dart';
import 'package:mvvm_architecture/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool me = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: InkWell(
            onTap: () {
              Utils.snackBar(
                "No internet connections",
                Colors.red,
                context,
              );

              // Utils.toastMessage("No internet connecti");
            },
            child: const Text("click"),
          ),
        ),
      ),
    );
  }
}
