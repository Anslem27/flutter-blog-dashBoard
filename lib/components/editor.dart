import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';
import '../models/data/dummy.dart';
import '../responsive.dart';

class BlogEditor extends StatefulWidget {
  const BlogEditor({
    Key? key,
  }) : super(key: key);

  @override
  State<BlogEditor> createState() => _BlogEditorState();
}

class _BlogEditorState extends State<BlogEditor> {
  final TextEditingController? editorController = TextEditingController();
  final ScrollController _controller = ScrollController();

  void _scrollToEnd() {
    var scrollPosition = _controller.position;

    if (scrollPosition.viewportDimension < scrollPosition.maxScrollExtent) {
      _controller.animateTo(
        scrollPosition.maxScrollExtent,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  //set some initial dummyPost Data
  // editorController!.text = dummyPost;
  void _printLatestValue() {
    print('Second text field: ${editorController!.text}');
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    editorController!.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Blog Editor",
                      style: GoogleFonts.ubuntu(
                        fontSize: 25,
                        color: Colors.blue,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding * 1.5,
                          vertical: defaultPadding /
                              (Responsive.isMobile(context) ? 2 : 1),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Theme.of(context).cardColor,
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text("Use Template"),
                    ),
                    IconButton(
                      splashRadius: 24,
                      onPressed: () {
                        editorController!.clear();
                      },
                      icon: Icon(
                        CupertinoIcons.clear,
                      ),
                    ),
                    IconButton(
                      splashRadius: 24,
                      onPressed: _scrollToEnd,
                      icon: Icon(
                        CupertinoIcons.down_arrow,
                      ),
                    )
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                SizedBox(
                  width: double.infinity,
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                    child: TextField(
                      controller: editorController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Description",
                      ),
                      onChanged: (text) {
                        editorController!.text;
                        setState(() {});
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.09),
          Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Blog Preview",
                  style: GoogleFonts.ubuntu(
                    fontSize: 25,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                SizedBox(
                  width: double.infinity,
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                    child: Markdown(
                      shrinkWrap: true,
                      data: editorController!.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
