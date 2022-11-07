import 'package:dashboard/components/chip_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';

class Details extends StatelessWidget {
  const Details({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: _body(context, isSelected),
    );
  }

   _body(BuildContext context, bool isSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Details",
          style: GoogleFonts.ubuntu(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: defaultPadding),
        Text(
          "Author",
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: defaultPadding),
        _author(),
        SizedBox(height: defaultPadding),
        Text(
          "Post Date",
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: defaultPadding),
        _publishDate(),
        SizedBox(height: defaultPadding),
        Text(
          "Tags",
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: defaultPadding),
        _tags(context, isSelected)
      ],
    );
  }

  _author() {
    return GlassmorphicContainer(
      width: double.maxFinite,
      height: 200,
      borderRadius: 8,
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 5, bottom: 5),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                "assets/images/avatar.jpg",
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                splashRadius: 24,
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.pen,
                ),
              ),
              Text(
                "Anslem",
                style: GoogleFonts.ubuntu(fontSize: 28),
              )
            ],
          ),
        ],
      ),
    );
  }

  _publishDate() {
    //date variables
    DateTime now = DateTime.now();
    String date = DateFormat('dd').format(now);
    String moyear = DateFormat('MMM yyyy').format(now);
    String time = DateFormat('kk:mm a').format(now);
    String formattedDate = "${date}th $moyear\nTime: $time";
    //
    return GlassmorphicContainer(
      width: double.maxFinite,
      height: 50,
      borderRadius: 8,
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
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              formattedDate,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: ChipContainer(color: Colors.deepPurple, text: "Automatic"),
          )
        ],
      ),
    );
  }

  _tags(BuildContext context, bool isSelected) {
    return Wrap(
      children: [
        ChoiceChip(
          label: Text('Post'),
          selected: isSelected,
          onSelected: (bool selected) {
            selected = isSelected;
          },
        ),
        SizedBox(
          width: 10,
        ),
        ChoiceChip(
          label: Text('Editors Selection'),
          selected: isSelected,
          onSelected: (bool selected) {},
          selectedColor: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }
}
