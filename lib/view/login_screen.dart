import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/color.dart';
import 'package:mvvm_architecture/res/components/round_button.dart';
import 'package:mvvm_architecture/utils/utils.dart';
import 'package:mvvm_architecture/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _emailfocus = FocusNode();
  FocusNode _passwordfocus = FocusNode();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailfocus.dispose();
    _passwordfocus.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        title: const Text("Login"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                  left: MediaQuery.of(context).size.width * 0.07,
                  right: MediaQuery.of(context).size.width * 0.07),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 11,
                      offset: Offset(0, 7),
                    )
                  ],
                ),
                child: TextFormField(
                  controller: _emailController,
                  focusNode: _emailfocus,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[50],
                    filled: true,
                    prefixIcon: const Icon(Icons.email),
                    label: const Text("Email"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context, _emailfocus, _passwordfocus);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                  left: MediaQuery.of(context).size.width * 0.07,
                  right: MediaQuery.of(context).size.width * 0.07),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 11,
                      offset: Offset(0, 7),
                    )
                  ],
                ),
                child: TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordfocus,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[50],
                    filled: true,
                    prefixIcon: const Icon(Icons.lock),
                    label: const Text("Password"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
              title: "Click here",
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushErrorMessage("Enter your email", context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushErrorMessage("Enter your password", context);
                } else if (_passwordController.text.length < 8) {
                  Utils.flushErrorMessage(
                      "Password must hava 8 character", context);
                } else {
                  Map data = {
                    "email": _emailController.text.toString(),
                    'password': _passwordController.text.toString(),
                  };
                  authViewModel.loginApi(data, context);
                  print("Api hit");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
