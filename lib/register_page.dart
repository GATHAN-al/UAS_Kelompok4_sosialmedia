import 'package:flutter/material.dart';
import 'package:flutter_application_chat/auth/auth_service.dart';
import 'package:flutter_application_chat/components/my_button.dart';
import 'package:flutter_application_chat/components/my_textfield.dart';
import 'package:flutter_application_chat/components/square_tile.dart';

class RegisterPage extends StatelessWidget {

  // Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // Register method
  Future<void> register(BuildContext context) async {
    final _auth = AuthService();

    // Password match check
    if (passwordController.text == confirmController.text) {
      try {
        // Await for async registration function
        await _auth.singUpWithEmailPassword(
          usernameController.text,
          passwordController.text,
        );

        // Jika berhasil, mungkin Anda ingin arahkan ke halaman lain atau tampilkan notifikasi sukses
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Registration successful!"),
          ),
        );
      } catch (e) {
        // Menampilkan error jika terjadi kesalahan saat pendaftaran
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      // Password tidak cocok
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // Logo
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 50),

              // Welcome message
              Text(
                "Let's create an account for you",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),

              // Username TextField
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obcureText: false,
              ),
              const SizedBox(height: 10),

              // Password TextField
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obcureText: true,
              ),
              const SizedBox(height: 10),

              // Confirm Password TextField
              MyTextField(
                controller: confirmController,
                hintText: 'Confirm Password',
                obcureText: true,
              ),
              const SizedBox(height: 10),

              // Forgot Password text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Register button
              MyButton(
                text: "Register",
                onTap: () => register(context),
              ),
              const SizedBox(height: 50),

              // Or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              // Google and Apple sign in buttons
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'lib/images/google.png'),
                  SizedBox(width: 25),
                  SquareTile(imagePath: 'lib/images/apple.png'),
                ],
              ),
              const SizedBox(height: 50),

              // Not a member? Login now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
