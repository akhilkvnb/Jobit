import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobit/Screens/profile/view/cvscreen.dart';

class Cv extends StatelessWidget {
  Cv({Key? key, this.heading}) : super(key: key);
  String? heading;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 236, 233, 233),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              offset: Offset(
                10.0, // Move to right 10  horizontally
                10.0, // Move to bottom 10 Vertically
              ),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            heading!,
            style: GoogleFonts.electrolize(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 11, 6, 26)),
          ),
          subtitle: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ScreenCv()));
              },
              child: const Text('SEE CV')),
        ),
      ),
    );
  }
}
