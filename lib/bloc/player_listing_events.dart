import 'package:players/model/nations.dart';

abstract class PlayerListingEvent{}


class CountrySelectedEvent extends PlayerListingEvent{
  final NationModel nationModel;

  CountrySelectedEvent({this.nationModel}) : assert(nationModel!=null);

}