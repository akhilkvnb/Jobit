import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobit/Screens/messagesearch.dart';
import 'package:jobit/Screens/typingmessage.dart';
import 'package:jobit/widgets/headertext.dart';

class ScreenMessage extends StatelessWidget {
  const ScreenMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 11, 6, 26),
        centerTitle: true,
        title: Headertext(title: 'Messages'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (cxt) => const SearchPage()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SafeArea(
          child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 11, 6, 26),
              radius: 28,
              backgroundImage: AssetImage('asset/abc.jpg'),
            ),
            title: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ScreenTyping()));
              },
              child: Text(
                'hello',
                style: GoogleFonts.electrolize(
                    color: const Color.fromARGB(255, 11, 6, 26)),
              ),
            ),
            subtitle: const Text('hhh'),
            trailing: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 11, 6, 26),
                  borderRadius: BorderRadius.circular(20)),
              constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
              child: const Text(
                '1',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      )),
    );
  }
}
