// ignore_for_file: file_names, use_build_context_synchronously
import 'package:chat/components/customTextField.dart';
import 'package:chat/helper/snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool obscureText = true;
  String? email;
  String? password;
  
  // Update GlobalKey to FormState for validation
  GlobalKey<FormState> key = GlobalKey<FormState>();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 15),
          child: Form(
            key: key,   // this is key to access to the form
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Image.asset(
                          "assets/395e84ce15a9e724114b1c433111da83.jpg",
                          height: 70,
                        ),
                      ),
                    ),
                    const SizedBox(height: 44),
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Login to Use Chat Application",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      onChange: (data) => email = data,
                      hintText: "Enter Your Email",
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Password",
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      onChange: (data) => password = data,
                      obscureText: obscureText,
                      iconButton: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Enter your password",
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      width: double.infinity,
                      child: const Text(
                        "Forget Password?",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          // Check if the form is valid before proceeding
                          if (key.currentState!.validate()) {
                            setState(() {
                              isloading=true;
                            });
                            try {
                              // Ensure that email and password are not null
                              if (email != null && password != null) {
                                await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: email!,
                                  password: password!,
                                );
                                showSnackBar(context, "Success");
                                Future.delayed(const Duration(seconds: 1),
                                ()
                                {
                                    Navigator.pushNamed(context, 'ChatScreen',arguments: email);

                                }

                                );
                                setState(() {
                              isloading = false;
                            });
                              } else {
                                showSnackBar(context, "Please enter your email and password");
                              }
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                showSnackBar(context, 'The Account Not Found');
                              } else if (e.code == 'wrong-password') {
                                showSnackBar(context, 'Wrong Password');
                              } else {
                                // Handle other Firebase exceptions
                                showSnackBar(context, 'Error: ${e.message}');

                              }
                              setState(() {
                                isloading=false;
                              });
                            } catch (e) {
                              // Handle any other errors
                              showSnackBar(context, 'An error occurred: $e');
                            }
                             setState(() {
                                isloading=false;
                              });
                          } else {
                            // If form is not valid, show an error
                            showSnackBar(context, "Please fill in all fields correctly");
                            setState(() {
                              isloading=false;
                            });
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 350,
                          height: 55,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 20, offset: Offset(1, 10)),
                            ],
                            color: Colors.cyan,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't Have An Account?",
                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'RegisterScreen');
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
