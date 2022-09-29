import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jobit/Screens/profile/provider/provider.dart';
import 'package:jobit/widgets/edittextfield.dart';
import 'package:jobit/widgets/edittitel.dart';
import 'package:jobit/widgets/headertext.dart';
import 'package:provider/provider.dart';

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
                Stack(
                  children: [
                    Consumer<ProfileProvider>(builder: (context, value, child) {
                      return value.imageFile == null
                          ? const CircleAvatar(
                              backgroundColor: Colors.yellow,
                              radius: 45,
                              backgroundImage: AssetImage('asset/abc.jpg'),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 45,
                              backgroundImage: FileImage(
                                  File(value.imageFile!.path),
                                  scale: 1.0),
                            );
                    }),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () async {
                            context.read<ProfileProvider>().pickimage();
                          },
                          icon: Icon(Icons.camera)),
                    )
                  ],
                ),
                Edittitle(title: 'Firstname'),
                EdtTextField(
                  title: 'Firstname',
                  controller:
                      context.watch<ProfileProvider>().firstnameController,
                ),
                Edittitle(title: 'Lastname'),
                EdtTextField(
                  title: 'Lastname',
                  controller:
                      context.watch<ProfileProvider>().lastnameController,
                ),
                Edittitle(title: 'Date of Birth'),
                // EdtTextField(
                //   title: 'Date of Birth',
                // ),
                TextFormField(),
                // Edittitle(title: 'Experience'),
                // EdtTextField(title: 'Experience'),
                // Edittitle(title: 'Education'),
                // EdtTextField(title: 'Education'),
                // Edittitle(title: 'Contact info'),
                // EdtTextField(title: 'Contact info'),
                Edittitle(title: 'About'),
                EdtTextField(
                  title: 'About',
                  controller: context.watch<ProfileProvider>().aboutController,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<ProfileProvider>().pickimage();
                      },
                      child: Text('CV')),
                ),
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
                  onPressed: () async {
                    context.read<ProfileProvider>().savebutton(context);
                  },
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
