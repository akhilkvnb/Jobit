import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobit/Screens/profile/model/profilegetmodel.dart';
import 'package:jobit/Screens/profile/provider/provider.dart';
import 'package:jobit/Screens/profile/view/edit.dart';
import 'package:jobit/widgets/profilecontainer.dart';
import 'package:jobit/widgets/profilecv.dart';
import 'package:provider/provider.dart';

class ScreenProfile extends StatelessWidget {
  ScreenProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ProfileGetModel?>(
          future: context.watch<ProfileProvider>().getProfileList(),
          builder: (context, snapshot) {
            // if (snapshot.hasError) {
            //   return Column(
            //     children: [
            //       Center(child: Lottie.asset('asset/error.jpg')),
            //       Text(
            //         snapshot.error.toString(),
            //         style: const TextStyle(fontSize: 20),
            //       )
            //     ],
            //   );
            // }
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return ListView(children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * .25 + 60,
                    child: Stack(children: [
                      Container(
                          height: MediaQuery.of(context).size.height * .25,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                  image: AssetImage('asset/hero-image.jpg'),
                                  fit: BoxFit.fill))),
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white)),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () {},
                              icon: const CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Icon(Icons.camera_alt_outlined,
                                    color: Colors.white),
                              ))),
                      Consumer<ProfileProvider>(
                          builder: (context, value, child) {
                        return Align(
                            alignment: Alignment.bottomCenter,
                            child: value.imageFile == null
                                ? const CircleAvatar(
                                    backgroundColor: Colors.yellow,
                                    radius: 60,
                                    backgroundImage:
                                        AssetImage('asset/abc.jpg'),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 60,
                                    backgroundImage: FileImage(
                                        File(value.imageFile!.path),
                                        scale: 1.0),
                                  ));
                      }),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: IconButton(
                              onPressed: () async {
                                context.read<ProfileProvider>().pickimage();
                              },
                              icon: const CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Icon(Icons.camera_alt_outlined,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (cxt) => const ScreenEdit()));
                              },
                              icon: const Icon(Icons.edit)))
                    ])),
                Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data!.userpro!.firstName!,
                          style: GoogleFonts.electrolize(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 11, 6, 26))),
                      const SizedBox(width: 5),
                      Text(snapshot.data!.userpro!.lastName!,
                          style: GoogleFonts.electrolize(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 11, 6, 26))),
                    ],
                  ),
                  // ),
                ),
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    child: ProfileContainer(
                      heading: 'About',
                      content: snapshot.data!.userpro!.about!,
                    )),
                const SizedBox(height: 5),
                Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    child: Cv(heading: 'CV')),
                const SizedBox(height: 5),
                Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    child: ProfileContainer(
                      heading: 'Date of Birth',
                      content: snapshot.data!.userpro!.dateOfBirth.toString(),
                    ))
              ]);
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
