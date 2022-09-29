import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobit/Screens/Login/view/login.dart';
import 'package:jobit/signout/signoutprovi.dart';
import 'package:jobit/utilitty/utility.dart';
import 'package:jobit/widgets/settingstile.dart';
import 'package:provider/provider.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Settings',
          style: GoogleFonts.blackOpsOne(
              fontSize: 22, color: const Color.fromARGB(255, 11, 6, 26)),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TileSettings(
              iconData: Icons.privacy_tip,
              item: 'Privacy Policy',
            ),
            TileSettings(
              iconData: Icons.memory_rounded,
              item: 'Version',
              version: '1.0.0',
            ),
            InkWell(
              onTap: () {
                context.read<SignoutProvider>().signOut(context);
              },
              child: TileSettings(
                iconData: Icons.logout,
                item: 'Signout',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
