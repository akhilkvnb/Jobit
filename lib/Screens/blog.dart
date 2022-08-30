import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobit/Screens/addblog.dart';
import 'package:jobit/Screens/readblog.dart';
import 'package:jobit/widgets/headertext.dart';

class ScreenBlog extends StatelessWidget {
  const ScreenBlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 11, 6, 26),
        centerTitle: true,
        title: Headertext(title: 'Blog'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ScreenAddBlog()));
              },
              icon: const Icon(Icons.add_circle_outline,
                  color: Colors.white, size: 30))
        ],
      ),
      body: ListView.builder(
          primary: true,
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: ((context, index) {
            return Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .07,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 11, 6, 26),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(children: const [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 14),
                                child: Text(
                                  'htfjfg fyfy hjihui gbgk oygufukfufyfjhkgguyugiiuyiu hijgkjgjhgjg jhgjyguytdghtduyfufufuyiufuyuyfuyutujhgutufuuyb 7g780y',
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 22),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .09,
                        width: MediaQuery.of(context).size.width * .18,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('asset/prsn.png'),
                                fit: BoxFit.cover),
                            color: const Color.fromARGB(255, 153, 0, 255),
                            boxShadow: const [
                              BoxShadow(color: Colors.white, spreadRadius: 3),
                            ],
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 40),
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ScreenReadBlog())),
                          child: Text(
                            'Name',
                            style: GoogleFonts.electrolize(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          })),
    );
  }
}
