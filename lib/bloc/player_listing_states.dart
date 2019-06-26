import 'package:players/model/player_list_model.dart';

abstract class PlayerListingStates{}

class PlayerUnInitializedState extends PlayerListingStates{}

class PlayerFetchingState extends PlayerListingStates{}

class PlayerFetchedState extends PlayerListingStates{
  final List<Player> players;

  PlayerFetchedState({this.players}) : assert(players!=null);
}

class PlayerErrorState extends PlayerListingStates{}

class PlayerEmptyState extends PlayerListingStates{}