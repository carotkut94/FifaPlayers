import 'package:flutter/material.dart';
import 'package:players/service/repository.dart';

void main() {

  PlayerRepository _repository = PlayerRepository();

  runApp(MyApp(playerRepository:_repository));
}
class MyApp extends StatelessWidget{

  final PlayerRepository playerRepository;

  MyApp({this.playerRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BLOC Implementation",
      home: Container()
    );
  }

}