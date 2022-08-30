import 'package:flutter/material.dart';

class ScreenTyping extends StatelessWidget {
  const ScreenTyping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              child: Image.asset('asset/prsn.png'),
            ),
            const SizedBox(width: 10),
            const Text('Name'),
          ],
        ),
      ),
      body: Column(children: const [
        SizedBox(height: 100, width: double.infinity),
      ]),
      bottomSheet: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextFormField(
                  decoration: InputDecoration(
                hintText: 'Typing...',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                fillColor: Colors.grey[200],
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 11, 6, 26))),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(),
                ),
              )),
            )),
            Padding(
                padding: const EdgeInsets.only(right: 16),
                child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                        onPressed: () {},
                        icon:
                            const Icon(Icons.send_sharp, color: Colors.white))))
          ]),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
