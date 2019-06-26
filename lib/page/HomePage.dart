import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players/bloc/player_listing_bloc.dart';
import 'package:players/page/player_listing.dart';
import 'package:players/service/repository.dart';
import 'package:players/theme/theme.dart';
import 'package:players/widget/horizontal_bar.dart';

class HomePage extends StatefulWidget {
  final PlayerRepository playerRepository;

  HomePage({this.playerRepository});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  PlayerListingBloc _playerListingBloc;

  @override
  void initState() {
    super.initState();
    _playerListingBloc =
        PlayerListingBloc(playerRepository: widget.playerRepository);
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: _playerListingBloc,
        child: Scaffold(
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
              PlayerListing()
            ],
          ),
        )
    );
  }
}
