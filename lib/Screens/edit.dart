import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobit/widgets/edittextfield.dart';
import 'package:jobit/widgets/edittitel.dart';
import 'package:jobit/widgets/headertext.dart';

class ScreenEdit extends StatelessWidget {
  const ScreenEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 6, 26),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Headertext(title: 'Edit'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Edittitle(title: 'Name'),
                EdtTextField(title: 'Name'),
                Edittitle(title: 'Headline'),
                EdtTextField(title: 'Headline'),
                Edittitle(title: 'Location'),
                EdtTextField(title: 'Location'),
                Edittitle(title: 'Experience'),
                EdtTextField(title: 'Experience'),
                Edittitle(title: 'Education'),
                EdtTextField(title: 'Education'),
                Edittitle(title: 'Contact info'),
                EdtTextField(title: 'Contact info'),
                const SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 11, 6, 26)),
                  ),
                  child: const Text('Save')),
            ),
          ),
        ],
      )),
    );
  }
}
