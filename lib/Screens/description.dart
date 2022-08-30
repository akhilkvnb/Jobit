import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobit/Screens/typingmessage.dart';
import 'package:jobit/widgets/Elevatedbutton.dart';

class ScreenDescription extends StatelessWidget {
  const ScreenDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                    width: double.infinity,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        'UI Designer',
                        style: GoogleFonts.electrolize(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 20),
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .16,
                      width: MediaQuery.of(context).size.width * .3,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage('asset/cmp.jpg'),
                              fit: BoxFit.fill)),
                    )
                  ],
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '*  Kowledge of online technology and related products,\n    including web and mobile UI and tools.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
          const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '*  Familarity with your user experience research \n    principles and practice and how to use data to\n    provide informed user insights',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButtom(
                      buttonname: 'Message',
                      onpressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ScreenTyping()));
                      }),
                )),
          )
        ],
      ),
    );
  }
}
