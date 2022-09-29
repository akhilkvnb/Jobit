import 'package:flutter/material.dart';
import 'package:jobit/Screens/blog/provider/provider.dart';
import 'package:jobit/widgets/Elevatedbutton.dart';
import 'package:provider/provider.dart';

class ScreenAddBlog extends StatelessWidget {
  const ScreenAddBlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 40),
                  TextFormField(
                      controller: context.read<BlogProvider>().titleController,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 11, 6, 26))),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(),
                        ),
                      )),
                  const SizedBox(height: 20),
                  TextFormField(
                      controller:
                          context.read<BlogProvider>().contentController,
                      maxLines: 15,
                      minLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Content',
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 11, 6, 26))),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(),
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButtom(
                  buttonname: 'Save',
                  onpressed: () =>
                      context.read<BlogProvider>().blogadd(context)),
            ),
            const SizedBox(height: 16)
          ],
        ),
      )),
      // resizeToAvoidBottomInset: false,
    );
  }
}
