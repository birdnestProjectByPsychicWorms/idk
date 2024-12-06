import 'package:birdnest/screen/AuthScreen/LoginScreen/index.dart';
import 'package:birdnest/screen/AuthScreen/SignScreen/index.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // Background image path
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SingleChildScrollView(
            child: SizedBox(
              height: screenHeight, // Ensures content fills the screen height
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    'assets/logo/logo.png', // Logo image path
                    width: screenWidth * 0.4, // 40% of screen width
                  ),
                  const SizedBox(height: 16),
                  // Description Text
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08, // 8% of screen width
                    ),
                    child: const Text(
                      'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Log in Button
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08, // 8% of screen width
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.06, // 6% of screen height
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                              const Color(0xFF007E33), // Text color
                          side: const BorderSide(
                            color: Color(0xFF007E33),
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(32.0), // Rounded corners
                          ),
                        ),
                        child: const Text(
                          'Log in',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Sign Up Button
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08, // 8% of screen width
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.06, // 6% of screen height
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF007E33),
                          foregroundColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(32.0), // Rounded corners
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
