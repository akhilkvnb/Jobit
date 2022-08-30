import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobit/Screens/edit.dart';
import 'package:jobit/widgets/profilecontainer.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
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
                  icon: const Icon(Icons.arrow_back, color: Colors.white)),
            ),
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const CircleAvatar(
                      backgroundColor: Colors.black,
                      child:
                          Icon(Icons.camera_alt_outlined, color: Colors.white),
                    ))),
            const Align(
              alignment: Alignment.bottomCenter,
              child: CircleAvatar(
                backgroundColor: Colors.yellow,
                radius: 60,
                backgroundImage: AssetImage('asset/abc.jpg'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 90),
                child: IconButton(
                    onPressed: () {},
                    icon: const CircleAvatar(
                      backgroundColor: Colors.black,
                      child:
                          Icon(Icons.camera_alt_outlined, color: Colors.white),
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
          child: Align(
            alignment: Alignment.topCenter,
            child: Text('name',
                style: GoogleFonts.electrolize(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 11, 6, 26))),
          )),
      const SizedBox(height: 20),
      Padding(
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: ProfileContainer(heading: 'Education')),
      const SizedBox(height: 5),
      Padding(
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: ProfileContainer(heading: 'Experience')),
      const SizedBox(height: 5),
      Padding(
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: ProfileContainer(heading: 'Contact'))
    ]));
  }
}
