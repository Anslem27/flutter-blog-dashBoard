import 'package:dashboard/constants.dart';
import 'package:flutter/material.dart';

class BlogPosts {
  final String? svgSrc, title;
  final int? numOfFiles, percentage;
  final Color? color;

  BlogPosts(
      {this.svgSrc, this.title, this.numOfFiles, this.percentage, this.color});
}

List demoMyFiles = [
  BlogPosts(
    title: "My Posts",
    numOfFiles: 1328,
    svgSrc: "assets/icons/Documents.svg",
    color: primaryColor,
    percentage: 35,
  ),
  BlogPosts(
    title: "Editors Picks",
    numOfFiles: 1328,
    svgSrc: "assets/icons/folder.svg",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
];
