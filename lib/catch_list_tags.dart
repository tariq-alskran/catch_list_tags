import 'package:flutter/material.dart';

class CatchListTags extends StatefulWidget {
  String labelText;
  String filterTag;

  //(String allText,String currentTag,String allTags)
  Function getListTags;
  Function getCurrentTag;

  CatchListTags(
      {@required this.labelText,
      @required this.filterTag,
      @required this.getListTags,
      @required this.getCurrentTag});

  @override
  _CatchListTagsState createState() => _CatchListTagsState();
}

class _CatchListTagsState extends State<CatchListTags> {
  final alphanumeric = RegExp(r'^[a-zA-Z0-9_]+$');

  bool startAutoComplete = false;

  int lengthText = 0;

  String lastTag = "";

  List<String> allTags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
        child: Container(
            child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(color: Theme.of(context).primaryColor),
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.0, color: Theme.of(context).primaryColor)),
                    labelText: widget.labelText,
                    hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                    labelStyle: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).primaryColor,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      width: 1.0,
                      color: Theme.of(context).primaryColor,
                    ))),
                onChanged: (text) {
                  if (text.isNotEmpty)
                    autoCompleteTags(text);
                  else
                    allTags.clear();
                })),
      ),
    );
  }

  /////// autoCompleteTags ///////

  void autoCompleteTags(String text) {
    widget.getListTags(allTags);
    if (text.endsWith(widget.filterTag) ||
        (lastTag == (widget.filterTag + text.substring(lengthText, text.length)))) {
      setState(() {
        startAutoComplete = true;
      });
      if (text.endsWith(widget.filterTag)) {
        lengthText = text.length;
      }
      print('Start Auto Complete');
    } else if (!alphanumeric
            .hasMatch(text.substring(lengthText, text.length)) &&
        startAutoComplete == true) {
      lastTag = widget.filterTag + text.substring(lengthText, text.length - 1);
      addTag(text.substring(lengthText, text.length - 1));
      setState(() {
        startAutoComplete = false;
      });
      print('End Auto Complete ');
    }
    if (startAutoComplete) {
      widget.getCurrentTag(text.substring(lengthText, text.length));
    }
  }

/////// addTag ///////

  void addTag(String tag) {
    if (tag.isNotEmpty) {
      bool isExist = false;
      for (var item in allTags) {
        if (item == tag) {
          isExist = true;
        }
      }
      if (!isExist) {
        setState(() {
          allTags.add(tag);
        });
        widget.getListTags(allTags);
      }
    }
  }
}
