import 'package:birdnest/screen/HomeScreen/index.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _validateAndLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      String username = _emailController.text.trim();
      String password = _passwordController.text.trim();

      if (username == "sodo" && password == "sodo123") {
        _showDialog(
          title: "Амжилттай",
          message: "Амжилттай нэвтэрлээ",
          isError: false,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        _showDialog(
          title: "Алдаа",
          message: "Нууц үг эсхүл Нэвтрэх нэр буруу байна.",
          isError: true,
        );
      }
    }
  }

  void _showDialog({
    required String title,
    required String message,
    required bool isError,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
              color: isError ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/loginBackground.png', // Background image path
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Section (Close Icon and Centered Log in Text)
              Padding(
                padding: EdgeInsets.fromLTRB(
                  16.0,
                  topPadding + 16.0,
                  16.0,
                  16.0,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(Icons.close,
                            size: 28, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context); // Close the screen
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Main Content (Vertically Centered Logo and Form)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidth * 0.1, // Responsive horizontal padding
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo
                        Image.asset(
                          'assets/logo/logo.png', // Logo image path
                          width: screenWidth * 0.25, // Responsive logo width
                        ),
                        const SizedBox(height: 16),
                        // Username Field
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a username";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        // Password Field
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a password";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        // Log In Button
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: _validateAndLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF007E33),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                            child: const Text(
                              'Log In',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Forgot Password Text
                        TextButton(
                          onPressed: () {
                            // Handle forgot password logic here
                          },
                          child: const Text(
                            'Forgot your password?',
                            style: TextStyle(
                              color: Color(0xFF007E33),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
