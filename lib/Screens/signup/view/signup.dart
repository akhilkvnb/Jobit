import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jobit/Screens/Login/view/login.dart';
import 'package:jobit/Screens/main/screemain.dart';
import 'package:jobit/Screens/signup/provider/signup_provider.dart';
import 'package:jobit/widgets/Elevatedbutton.dart';
import 'package:jobit/widgets/googlebutton.dart';
import 'package:jobit/widgets/headertext.dart';
import 'package:jobit/widgets/textfield.dart';
import 'package:provider/provider.dart';

class ScreenSignup extends StatelessWidget {
  const ScreenSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 12, 35, 54),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(80)),
                image: DecorationImage(image: AssetImage('asset/srj.png'))),
          )),
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  height: height,
                  width: height,
                  color: const Color.fromARGB(255, 12, 35, 54),
                  child: Container(
                    height: height,
                    width: height,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(80))),
                  ),
                ),
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Center(
                      child: Headertext(title: 'SignUp'),
                    ),
                    Form(
                      key: context.watch<SignUpProvider>().signupformkey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 15, bottom: 10),
                            child: CustomTextField(
                              controller: context
                                  .watch<SignUpProvider>()
                                  .usernameController,
                              validator: (value) => context
                                  .read<SignUpProvider>()
                                  .validatorUsername(value!),
                              text: 'Username',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 10, bottom: 10),
                            child: CustomTextField(
                              controller: context
                                  .watch<SignUpProvider>()
                                  .emailController,
                              validator: (value) => context
                                  .read<SignUpProvider>()
                                  .validatorEmail(value!),
                              text: 'Email id',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 10, bottom: 10),
                            child: CustomTextField(
                              controller: context
                                  .watch<SignUpProvider>()
                                  .passworController,
                              validator: (value) => context
                                  .read<SignUpProvider>()
                                  .validatorPassword(value!),
                              text: 'Password',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 10, bottom: 10),
                            child: CustomTextField(
                              controller: context
                                  .watch<SignUpProvider>()
                                  .conformpasswordController,
                              validator: (value) => context
                                  .read<SignUpProvider>()
                                  .validatorConformPassword(value!),
                              text: 'ConformPassword',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 10, top: 20),
                      child: CustomElevatedButtom(
                        buttonname: 'SignUp',
                        onpressed: () {
                          context
                              .read<SignUpProvider>()
                              .signupValidation(context);
                        },
                      ),
                    ),
                    const Center(child: Text('-or-')),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 16, right: 16),
                      child: GoogleButton(),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 80, right: 10, top: 10),
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Login',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ScreenLogin()))
                                      },
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
