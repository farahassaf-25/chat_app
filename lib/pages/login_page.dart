import 'package:chat_app/helper/show_snackbar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kBlueColor,
        appBar: AppBar(
          backgroundColor: kBlackColor,
          title: const Text(
            'Chat App',
            style: TextStyle(
              color: kWhiteColor,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Icon(
                kLogo,
                color: kWhiteColor,
                size: 70,
              ),
              const SizedBox(height: 15),
              const Text(
                'Let\'s Talk!',
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: CustomTextField(
                    onChanged: (data) {
                      email = data;
                    },
                    message: 'Enter Email Address'),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: CustomTextField(
                    obscurePass: true,
                    onChanged: (data) {
                      password = data;
                    },
                    message: 'Enter Password'),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await loginUser();
                          Navigator.pushNamed(context, ChatPage.id,
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(context, 'User not found');
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(context, 'Wrong password');
                          }
                        } catch (e) {
                          showSnackBar(context, e.toString());
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    },
                    text: 'Sign In'),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RegisterPage.id);
                },
                child: const Text(
                  'Don\'t have an account? Register',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
