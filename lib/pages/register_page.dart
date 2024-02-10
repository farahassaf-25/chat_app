import 'package:chat_app/helper/show_snackbar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
          automaticallyImplyLeading: false,
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
                          await registerUser();
                          Navigator.pushNamed(context, ChatPage.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackBar(context, 'Weak password');
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(context, 'Email already exits');
                          }
                        } catch (e) {
                          showSnackBar(context, e.toString());
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    },
                    text: 'Sign Up'),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Already have an account? Login',
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

  Future<void> registerUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
