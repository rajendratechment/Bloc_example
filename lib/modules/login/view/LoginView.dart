import 'package:flutter/material.dart';

import '../constant/Strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _login() {
    // Implement login action here
    print('Username: ${_usernameController.text}');
    print('Password: ${_passwordController.text}');
  }

  void _register() {
    // Implement register action here
    print('Register button pressed');
  }

  void _forgotPassword() {
    // Implement forgot password action here
    print('Forgot Password button pressed');
  }

  void _help() {
    // Implement help action here
    print('Help button pressed');
  }

  @override
  Widget build(BuildContext context) {
     var localization =AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/tap_tip_logo.png', height: 60),
              const SizedBox(height: 10),
               Text(
                localization!.simplyDeserveIt,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 50),
              TextFormField(
                controller: _usernameController,
                decoration:  InputDecoration(
                  labelText: localization.username,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: localization.password,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _register,
                    child:  Text(
                      localization.register,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffed7a32),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    child:  Text(
                      localization.login,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 180),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    localization.troubleLoggingIn,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.black87),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _forgotPassword,
                    child:  Text(
                      localization.forgotPassword,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: _help,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black87),
                    ),
                    icon: const Icon(
                      Icons.headphones_outlined,
                      color: Colors.black87,
                    ),
                    label:  Text(
                      localization.help,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
