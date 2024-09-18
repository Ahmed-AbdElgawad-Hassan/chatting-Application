// ignore_for_file: use_build_context_synchronously

import 'package:chat/components/customTextField.dart';
import 'package:chat/helper/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  bool obscureText = true;
  String? email;
  String? password;
  GlobalKey<FormState> key = GlobalKey();
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
            key: key,
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
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Register to Continue Using The App",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "UserName",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(hintText: "Enter Your UserName"),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Email",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        onChange: (data) => email = data,
                        hintText: "Enter Your Email"),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Password",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
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
                      onChange: (data) => password = data,
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          if (key.currentState!.validate()) {
                            setState(() {
                              isloading = true;
                            });
                            try {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: email!,
                                password: password!,
                              );
                              showSnackBar(context, 'Success');
                              Future.delayed(
                                  const Duration(
                                      seconds:
                                          1), // this is method to execute code after spicific time
                                  () {
                                Navigator.pushNamed(context, 'ChatScreen',arguments: email);
                              });
                               setState(() {
                              isloading = false;
                            }); 

                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                showSnackBar(
                                    context, 'Sorry the Password is Weak');
                                    setState(() {
                              isloading = false;
                            });
                              } 
                              
                              else if (e.code == 'email-already-in-use') {
                                showSnackBar(context,
                                    'This account already exists for that email.');
                                    setState(() {
                              isloading = false;
                            });
                              }
                            } catch (e) {
                              print(e);
                               
                            }
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 350,
                          height: 55,
                          decoration: const BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20,
                                  offset: Offset(1, 10))
                            ],
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: const Text(
                          "-------  OR  -------",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 16),
                        )),
                    const SizedBox(height: 20),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Have An Account ?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    color: Colors.blue),
                              ),
                            ),
                          ],
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
