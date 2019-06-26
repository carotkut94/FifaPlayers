import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:players/model/player_list_model.dart';

class PlayerProvider{
  String baseUrl = "https://www.easports.com/fifa/ultimate-team/api/fut/item?";

  Future<List<Player>> fetchPlayerByCountry(String countryId) async{
    final response = await http.get("$baseUrl+country=$countryId");

    final responseString = jsonDecode(response.body);

    if(response.statusCode == 200){
      return ApiResult.fromJson(responseString).items;
    }else{
      throw Exception("failed to load players");
    }
  }
}