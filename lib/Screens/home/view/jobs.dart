import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobit/Screens/description.dart';
import 'package:jobit/Screens/home/view/addjob.dart';
import 'package:jobit/Screens/profile/model/profilegetmodel.dart';
import 'package:jobit/Screens/profile/view/profile.dart';
import 'package:jobit/search.dart';
import 'package:jobit/widgets/headertext.dart';
import 'package:jobit/widgets/slider.dart';

import '../../profile/view/edit.dart';

class ScreenJobs extends StatelessWidget {
  const ScreenJobs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 11, 6, 26),
          leading: Image.asset('asset/jobfinder.png',
              width: 150, height: 100, fit: BoxFit.cover),
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
                              MaterialPageRoute(builder: (cxt) => ScreenEdit()
                                  //  ScreenProfile()
                                  ));
                        },
                        icon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        )))),
          ]),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
              child: Column(children: [
                Row(children: const [
                  Text('Hello...'),
                  Icon(
                    Icons.waving_hand,
                    size: 18,
                    color: Colors.orangeAccent,
                  ),
                ]),
                const SizedBox(
                  height: 6,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Find your dream jobs here',
                      style: GoogleFonts.electrolize(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 11, 6, 26)),
                    )),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (cxt) => const ScreenSearch()));
                    },
                    child: Row(children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 228, 226, 226),
                          ),
                          child: const Text(
                            'What are you looking for?',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 11, 6, 26)),
                          child: const Icon(Icons.search, color: Colors.white))
                    ]))
              ])),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              children: [
                const CusSlider(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jobs',
                            style: GoogleFonts.electrolize(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 11, 6, 26)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ScreenAddJob()));
                            },
                            child: Text(
                              'Add jobs',
                              style: GoogleFonts.electrolize(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 5),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .12,
                              width: MediaQuery.of(context).size.width * 13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 228, 226, 226),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .09,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .2,
                                        decoration: BoxDecoration(
                                            color: Colors.orange,
                                            image: const DecorationImage(
                                                image:
                                                    AssetImage('asset/cmp.jpg'),
                                                fit: BoxFit.fill),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8,
                                              ),
                                              child: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (cxt) =>
                                                                const ScreenDescription()));
                                                  },
                                                  child: const Text(
                                                      'UX Designer',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                          color: Color.fromARGB(
                                                              255,
                                                              11,
                                                              6,
                                                              26))))),
                                          const Text('Location: Calicut',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 97, 96, 96)))
                                        ]),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .04,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .16,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: const Color.fromARGB(
                                                255, 89, 90, 92)),
                                        child: const Center(
                                            child: Text(
                                          'Full time',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
