import 'package:flutter/material.dart';
import 'package:flutter_application_chat/auth/auth_service.dart';
import 'package:flutter_application_chat/components/my_button.dart';
import 'package:flutter_application_chat/components/my_textfield.dart';
import 'package:flutter_application_chat/components/square_tile.dart';
import 'package:flutter_application_chat/forgot_password.dart';

class LoginPage extends StatelessWidget{
//text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // tap to go register page
  final void Function()? onTap;

   LoginPage({super.key, required this.onTap});



  //sign user in method
  void login(BuildContext context)async {
    // auth sevice 
    final authService = AuthService();

    // try login
    try{
      await authService.signInWithEmailPassword(usernameController.text, passwordController.text,);
    }

    // cath any erros
    catch (e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text(e.toString()),
      ),
    );
  }
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              //logo
              const Icon(
                Icons.lock,
                size: 100,
                ), 
               const SizedBox(height: 50),

      
              //welcome back,
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

          
              //username
             MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obcureText: false,
             ),
           
               const SizedBox(height: 10),

              //password
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obcureText: true,
              ),

              const SizedBox(height: 10),


              //forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ForgotPasswordPage();

                        },
                        ),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style:TextStyle(
                          color: Colors.blue[600],
                          fontWeight: FontWeight.bold,
                          ),
                      
                        ),
                    ),
                  ],
                ),
              ) ,

               const SizedBox(height: 25),

          // sign in
          MyButton(
            onTap: () => login(context), 
            text: 'Login',
          ),

               const SizedBox(height: 50),


               // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(children: [
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


              // google + apple  sign in buttons
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  SquareTile(imagePath: 'lib/images/google.png'),

                   SizedBox(width: 25),

                  SquareTile(imagePath: 'lib/images/apple.png')
                  


                ],
              ),
               const SizedBox(height: 50),

               // not a member
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
                )
          ],
          ),
        ),
      
    );
  }
}