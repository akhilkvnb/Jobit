import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jobit/main/screemain.dart';
import 'package:jobit/signup/signup.dart';
import 'package:jobit/widgets/Elevatedbutton.dart';
import 'package:jobit/widgets/googlebutton.dart';
import 'package:jobit/widgets/headertext.dart';
import 'package:jobit/widgets/textfield.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('asset/login.png'))),
            )),
            Expanded(
                //flex: 2,
                child: ListView(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, bottom: 10),
                    child: Headertext(title: 'Login'),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 10, bottom: 10),
                    child: CustomTextField(text: 'Email id')),
                const Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 5),
                    child: CustomTextField(text: 'Password')),
                const Padding(
                  padding: EdgeInsets.only(right: 20, top: 8, bottom: 8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Color.fromARGB(255, 11, 6, 26),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 6),
                  child: CustomElevatedButtom(
                    buttonname: 'Login',
                    onpressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (cxt) => const ScreenMain()));
                    },
                  ),
                ),
                const Center(child: Text('-or-')),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 6),
                  child: GoogleButton(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, right: 8, top: 10),
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'SignUp',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ScreenSignup()))
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
            ))
          ],
        ),
      ),
    );
  }
}
