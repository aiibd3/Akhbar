



import 'package:Akhbar/models/sourceResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabItem extends StatelessWidget {
  Sources sources;
  bool isSelected;
  TabItem(this.sources,this.isSelected);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6,horizontal: 6),
      decoration: BoxDecoration(
        color: isSelected? Colors.blueGrey:Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueGrey)
      ),
      child: Text(sources.name??"",style: TextStyle(
        color: isSelected? Colors.white:Colors.blueGrey
      )),


    );
  }
}
