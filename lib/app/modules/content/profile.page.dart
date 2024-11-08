import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mge_ahmadabuhasan/app/modules/content/content.controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final ContentController _controller = Get.put(ContentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20.0,),
              const Icon(
                Icons.people,
                size: 100.0,
              ),
              const SizedBox(height: 10.0,),
              TextFieldInput(
                controller: _controller.controllerUsername, 
                icon: Icons.person,
                textLabel: 'Username', 
                textHint: 'Yenny', 
                textError: '',
              ),
              const SizedBox(height: 10.0,),
              TextFieldInput(
                controller: _controller.controllerPhone, 
                icon: Icons.phone,
                textLabel: 'Phone', 
                textHint: '+6281-2345-6789', 
                textError: '',
              ),
              const SizedBox(height: 10.0,),
              TextFieldInput(
                controller: _controller.controllerAddress, 
                icon: Icons.home,
                textLabel: 'Address', 
                textHint: 'Surabaya, Indonesia', 
                textError: '',
              ),
            ],
          ),
        )),
    );
  }
}

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String textLabel;
  final String textHint;
  final String textError;

  const TextFieldInput({
    super.key, 
    required this.controller,
    required this.icon,
    required this.textLabel, 
    required this.textHint,
    required this.textError,
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