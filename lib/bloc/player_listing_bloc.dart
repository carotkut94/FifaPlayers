import 'package:bloc/bloc.dart';
import 'package:players/bloc/player_listing_events.dart';
import 'package:players/bloc/player_listing_states.dart';
import 'package:players/model/player_list_model.dart';
import 'package:players/service/repository.dart';

class PlayerListingBloc extends Bloc<PlayerListingEvent, PlayerListingStates>{

  PlayerRepository playerRepository;

  PlayerListingBloc({this.playerRepository}) : assert(playerRepository!=null);

  @override
  PlayerListingStates get initialState => PlayerUnInitializedState();

  @override
  Stream<PlayerListingStates> mapEventToState(PlayerListingStates currentState, PlayerListingEvent event) async* {
    if(event is CountrySelectedEvent){
      yield PlayerFetchingState();
      try {
        final List<Player> players = await playerRepository
            .fetchPlayerByCountry(event.nationModel.countryId);

        if (players.length == 0) {
          yield PlayerEmptyState();
        } else {
          yield PlayerFetchedState(players: players);
        }
      }catch(e){
        print('error caught: $e');
        yield PlayerErrorState();
      }
    }
  }

}