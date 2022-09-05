import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobit/widgets/settingstile.dart';

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
            TileSettings(
              iconData: Icons.logout,
              item: 'Signout',
            ),
          ],
        ),
      ),
    );
  }
}
