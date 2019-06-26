import 'package:players/model/player_list_model.dart';
import 'package:players/service/player_provider.dart';

class PlayerRepository{
  PlayerProvider _playerProvider = PlayerProvider();

  Future<List<Player>> fetchPlayerByCountry(String countryId) => _playerProvider.fetchPlayerByCountry(countryId);
}