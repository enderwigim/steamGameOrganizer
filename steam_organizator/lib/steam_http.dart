import 'package:http/http.dart' as http;
import 'package:dotenv/dotenv.dart' as dotenv;
import 'dart:convert';

import 'package:steam_organizator/steam_game.dart'; 

class SteamCom {

  // http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=XXXXXXXXXXXXXXXXX&steamid=76561197960434622&format=json
  String apiUrl = "api.steampowered.com";
  List services = [
    "IPlayerService"
  ];
  String? apiKey;
  String? steamID;

  SteamCom(String steamId) {
    // CREATE ENV VARIABLE
    dotenv.DotEnv env = dotenv.DotEnv(includePlatformEnvironment: true);
    env.load();

    // GET API_KEY
    apiKey = env["API_KEY"]; 
    steamID = steamId;
  }

  getUserGames() async {
    // Uri Construction
    final Uri uri = Uri(
      scheme: 'https',
      host: apiUrl,
      path: 'IPlayerService/GetOwnedGames/v0001',
      queryParameters: {
        'key': apiKey,
        'steamid': steamID,
        'include_appinfo': "true",
        'format' : 'json',
      }
    );

  try {
    // Make GET
    final response = await http.get(uri);

    // Verify is was okay.
    if (response.statusCode == 200) {
      // Decode response
      final Map<String, dynamic> data = jsonDecode(response.body);
      // Get array with everygame name.
      final dataArr = data["response"]["games"];
      // Generate a list with the SteamGames.
      List<SteamGame> games = [];
      dataArr.forEach((game) => {
        games.add(SteamGame(game["name"]))
      });
      return games;
    } else {
      print('Error en la solicitud: ${response.statusCode}');
    }
  } catch (e) {
    print('Ocurrió un error: $e');
  }


  }

}