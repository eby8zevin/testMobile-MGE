import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mge_ahmadabuhasan/app/modules/auth/auth.controller.dart';
import 'package:test_mge_ahmadabuhasan/core/theme/colors.dart';

import '../../../routes/pages.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx( () => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/login.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Text(controller.flavor == 'live' ? '1.0.0' : '',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 6.0,),
              TextFieldInput(
                controller: controller.usernameController, 
                icon: Icons.person,
                textLabel: 'Username', 
                textHint: 'username', 
                textError: controller.errorMessageUsername.value,
                obsecure: false,
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFieldInput(
                controller: controller.passwordController, 
                icon: Icons.key_outlined,
                textLabel: 'Password', 
                textHint: 'password', 
                textError: controller.errorMessagePassword.value,
                obsecure: true,
              ),
              const SizedBox(
                height: 40.0,
              ),
              SizedBox(
                width: 300,
                height: 48,
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.validateLogin()) {
                        controller.storage.login(true);
                        Get.offAllNamed(Routes.content);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
    ));
  }
}

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String textLabel;
  final String textHint;
  final String textError;
  final bool obsecure;

  const TextFieldInput({
    super.key, 
    required this.controller,
    required this.icon,
    required this.textLabel, 
    required this.textHint,
    required this.textError,
    required this.obsecure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 50.0,
        right: 50.0
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 8),
              Text(textLabel), 
            ],
          ),
          TextFormField(
            controller: controller,
            obscureText: obsecure,
            cursorColor: Colors.blue,
            cursorErrorColor: Colors.blue,
            decoration: InputDecoration(
              hintText: textHint,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              errorText: textError
            ),
          ),
        ],
      ),
    );
  }
}