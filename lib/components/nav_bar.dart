import 'package:dashboard/responsive.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;
import 'appbar_logo.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          // IconButton(
          //   splashRadius: 24,
          //   icon: Icon(Icons.menu_rounded),
          //   onPressed: () {},
          // ),
          NavBarLogo(),
        if (!Responsive.isMobile(context)) NavBarLogo(),
        // if (!Responsive.isMobile(context))
        //   Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        const SizedBox(width: 20),
        Expanded(child: _checkOtherPortfolio()),
      ],
    );
  }

  _checkOtherPortfolio() {
    return GlassmorphicContainer(
      width: double.maxFinite,
      height: 50,
      borderRadius: 8,
      padding: const EdgeInsets.all(6),
      alignment: Alignment.center,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.1),
            const Color(0xFFFFFFFF).withOpacity(0.1),
          ],
          stops: const [
            0.1,
            1,
          ]),
      borderGradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.transparent, Colors.transparent],
      ),
      border: 2,
      blur: 20,
      child: RichText(
        text: TextSpan(
          text: 'While you are here, why not visit ',
          style: GoogleFonts.ubuntu(
            color: Colors.white,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Anslem.io',
              style: GoogleFonts.ubuntu(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  js.context
                      .callMethod('open', ["https://anslem27.github.io/"]);
                },
            ),
            TextSpan(
              text: " would really appreciate a review.",
              style: GoogleFonts.ubuntu(),
            )
          ],
        ),
      ),
    );
  }
}
