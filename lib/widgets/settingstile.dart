import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TileSettings extends StatelessWidget {
  TileSettings({Key? key, this.item, this.iconData, this.version})
      : super(key: key);
  String? item;
  IconData? iconData;
  String? version;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: const Color.fromARGB(255, 11, 6, 26),
      ),
      title: Text(
        item!,
        style: GoogleFonts.electrolize(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 11, 6, 26)),
      ),
      trailing: version != null
          ? Text(
              version!,
              style: GoogleFonts.electrolize(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 11, 6, 26)),
            )
          : const SizedBox(),
    );
  }
}
