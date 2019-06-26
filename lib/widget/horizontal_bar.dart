import 'package:flutter/material.dart';
import 'package:players/model/nations.dart';

class HorizontalBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView.builder(
          itemBuilder: buildItem,
          itemCount: nations.length,
          scrollDirection: Axis.horizontal),
    );
  }

  Widget buildItem(context, index) {
    return InkWell(
      onTap: () {
        //TODO: Country click event
      },
      child: Container(
        width: 70.0,
        height: 70.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            
            image: AssetImage(nations[index].imagePath),
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }

  Widget buildSeparator(context, index) {
    return VerticalDivider(
      width: 32.0,
      color: Colors.transparent,
    );
  }
}
