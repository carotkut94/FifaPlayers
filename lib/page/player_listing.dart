import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players/bloc/player_listing_bloc.dart';
import 'package:players/bloc/player_listing_states.dart';
import 'package:players/model/player_list_model.dart';
import 'package:players/theme/theme.dart';
import 'package:players/widget/message.dart';

class PlayerListing extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<PlayerListingBloc>(context),
      builder: (context, state){
        if(state is PlayerUnInitializedState){
          return Message(message:"Please select country flag");
        }else if(state is PlayerEmptyState){
          return Message(message:"No Players");
        }else if(state is PlayerErrorState){
          return Message(message:"Something went wrong!");
        }else if(state is PlayerFetchingState){
          return Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }else{
          final stateAsPlayerFetched =  state as PlayerFetchedState;
          final players = stateAsPlayerFetched.players;
          return buildPlayerList(players);
        }
      },
    );
  }

  Widget buildPlayerList(List<Player> players){
    return Expanded(
      child: ListView.separated(itemBuilder: (context,index){
        return ListTile(
          leading: Image.network(players[index].headshot.imgUrl),
          title: Text(players[index].name, style: titleTextStyle),
          subtitle: Text(players[index].club.name, style: subTitleTextStyle),
        );
      },separatorBuilder: (context, index){

      }, itemCount: players.length),
    );
  }

}