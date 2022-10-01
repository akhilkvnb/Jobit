import 'package:flutter/material.dart';
import 'package:jobit/Screens/blog/view/blog.dart';
import 'package:jobit/Screens/home/view/jobs.dart';
import 'package:jobit/Screens/message.dart';
import 'package:jobit/Screens/settings/view/settings.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics:
            const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _tabController,
        children: const <Widget>[
          ScreenJobs(),
          ScreenBlog(),
          ScreenMessage(),
          ScreenSettings()
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Jobs",
        labels: const ["Jobs", "Blog", "message", "Settings"],
        icons: const [
          Icons.shopping_bag,
          Icons.edit_note,
          Icons.message,
          Icons.settings
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Color.fromARGB(255, 11, 6, 26),
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: const Color.fromARGB(255, 11, 6, 26),
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: const Color.fromARGB(255, 11, 6, 26),
        tabIconSelectedColor: Colors.white,
        tabBarColor: const Color(0xFFAFAFAF),
        onTabItemSelected: (int value) {
          setState(() {
            _tabController.index = value;
          });
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:jobit/Screens/blog/view/blog.dart';
// import 'package:jobit/Screens/home/view/jobs.dart';
// import 'package:jobit/Screens/message.dart';
// import 'package:jobit/Screens/settings.dart';
// import 'package:jobit/widgets/bottomnav_active_wrapper.dart';

// class ScreenMain extends StatefulWidget {
//   const ScreenMain({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ScreenMain> createState() => _ScreenMainState();
// }

// class _ScreenMainState extends State<ScreenMain> {
//   int _currentIndex = 0;
//   bool isSelected = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _children[_currentIndex],
//       backgroundColor: Colors.transparent,
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           BottomNavigationBar(
//               // backgroundColor: Colors.black,
//               selectedItemColor: const Color.fromARGB(255, 11, 6, 26),
//               unselectedItemColor: const Color.fromARGB(255, 11, 6, 26),
//               onTap: onTappedBar,
//               selectedLabelStyle: const TextStyle(color: Colors.black),
//               unselectedLabelStyle: const TextStyle(color: Colors.black),
//               currentIndex: _currentIndex,
//               items: const [
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.shopping_bag),
//                   activeIcon: BottmNavActiveWrapper(
//                       icon: Icon(Icons.shopping_bag, color: Colors.white)),
//                   label: 'Jobs',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.edit_note),
//                   activeIcon: BottmNavActiveWrapper(
//                       icon: Icon(
//                     Icons.edit_note,
//                     color: Colors.white,
//                   )),
//                   label: 'Blog',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.message),
//                   activeIcon: BottmNavActiveWrapper(
//                       icon: Icon(Icons.message, color: Colors.white)),
//                   label: 'Message',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.settings),
//                   activeIcon: BottmNavActiveWrapper(
//                       icon: Icon(
//                     Icons.settings,
//                     color: Colors.white,
//                   )),
//                   label: 'Settings',
//                 ),
//               ]),
//         ],
//       ),
//     );
//   }

//   final List<Widget> _children = [
//     const ScreenJobs(),
//     const ScreenBlog(),
//     const ScreenMessage(),
//     const ScreenSettings()
//   ];

//   void onTappedBar(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }
