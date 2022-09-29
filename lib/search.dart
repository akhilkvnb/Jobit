import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobit/widgets/headertext.dart';
import 'Screens/profile/view/profile.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 11, 6, 26),
        leading: Image.asset(
          'asset/jobfinder.png',
          width: 150,
          height: 100,
          fit: BoxFit.cover,
        ),
        title: Headertext(title: 'Jobfinder'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 22,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (cxt) => ScreenProfile()));
                  },
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  )),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hello'),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Find your dream jobs here',
                  style: GoogleFonts.electrolize(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 11, 6, 26)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 10),
                            hintText: 'What are you looking for?',
                            fillColor: Color.fromARGB(255, 228, 226, 226),
                            filled: true),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 11, 6, 26)),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            )))
                  ],
                ),
              ],
            ),
          )),
          Expanded(child: Column())
        ],
      )),
    );
  }
}
