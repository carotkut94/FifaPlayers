import 'package:flutter/material.dart';
import 'package:players/service/repository.dart';
import 'package:players/theme/theme.dart';
import 'package:players/widget/horizontal_bar.dart';

class HomePage extends StatelessWidget{

  final PlayerRepository playerRepository;

  HomePage({this.playerRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Football Player', style: appBarTextStyle),
      ),
      body: Column(
        children: <Widget>[
          HorizontalBar(),
          SizedBox(height: 10.0),
          //PlayerList()
        ],
      ),
    );
  }
}