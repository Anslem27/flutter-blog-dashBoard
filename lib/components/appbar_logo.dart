// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';
//import 'dart:js' as js;

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        splashColor: colors["primary"],
        onTap: () {
          //js.context.callMethod('open', ["#"]);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("./assets/images/rabbit.png"),
            Text(
              "Anslem's DashBoard",
              style: GoogleFonts.poorStory(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
