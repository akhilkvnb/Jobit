import 'package:flutter/material.dart';
import 'package:jobit/Screens/home/model/category.dart';
import 'package:jobit/Screens/home/provider/categoryprovider.dart';
import 'package:jobit/widgets/edittextfield.dart';
import 'package:provider/provider.dart';
import '../provider/jobprovider.dart';

class ScreenAddJob extends StatefulWidget {
  ScreenAddJob({Key? key}) : super(key: key);

  @override
  State<ScreenAddJob> createState() => _ScreenAddJobState();
}

class _ScreenAddJobState extends State<ScreenAddJob> {
  @override
  void initState() {
    context.read<CategoryProvider>().getListCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // FutureBuilder<List<CategoryModel>?>(
          //     future: context.watch<CategoryProvider>().getListCategory(),
          //     builder: (context, snapshot) {
          //       // if (snapshot.hasError) {
          //       //   return Column(
          //       //     children: [
          //       //       Center(child: Image.asset('asset/error.jpg')),
          //       //       Text(
          //       //         snapshot.error.toString(),
          //       //         style: const TextStyle(fontSize: 20),
          //       //       )
          //       //     ],
          //       //   );
          //       // }
          //       if (snapshot.hasData &&
          //           snapshot.connectionState == ConnectionState.done) {
          //         return Container(
          //           padding: EdgeInsets.only(left: 15, right: 15, top: 5),
          //           color: Colors.white,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: <Widget>[
          //               Expanded(
          //                 child: DropdownButtonHideUnderline(
          //                   child: ButtonTheme(
          //                     alignedDropdown: true,
          //                     child: DropdownButton<String>(
          //                       //value: snapshot.data!.,
          //                       iconSize: 30,
          //                       icon: (null),
          //                       style: TextStyle(
          //                         color: Colors.black54,
          //                         fontSize: 16,
          //                       ),
          //                       hint: Text('Select State'),

          //                       onChanged: (String? newValue) {
          //                         //   // setState(() {
          //                         //   //   _myState = newValue;
          //                         //   //   _getCitiesList();
          //                         //   //   print(_myState);
          //                         //   // });
          //                       },
          //                       items: context
          //                               .read<CategoryProvider>()
          //                               .statesList
          //                               ?.map((item) {
          //                             return new DropdownMenuItem(
          //                               child: new Text(item['name']),
          //                               value: item['id'].toString(),
          //                             );
          //                           }).toList() ??
          //                           [],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         );
          //       }
          //       return CircularProgressIndicator();
          //     }),
          const SizedBox(height: 20),
          EdtTextField(
            title: 'jobtitle',
            controller1: context.read<JobProvider>().jobtitleController,
          ),
          const SizedBox(height: 20),
          EdtTextField(
            title: 'jobdescription',
            controller1: context.read<JobProvider>().jobdescriptionController,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    context.read<JobProvider>().jobadd(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 11, 6, 26)),
                  ),
                  child: const Text('Save')),
            ),
          ),
        ],
      ),
    );
  }
}
