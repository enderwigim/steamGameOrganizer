//import 'package:steam_game_organizer/steam_game_organizer.dart' as steam_game_organizer;
import 'package:steam_organizator/steam_http.dart' as steam_http;
import 'package:steam_organizator/steam_game.dart';
import 'package:steam_organizator/hours_getter.dart';
void main() async {
  /*
  // Generate Conection with steam.
  steam_http.SteamCom steamCon = steam_http.SteamCom("76561198084887486");
  List<SteamGame> games = await steamCon.getUserGames();
  // Loop through each game and print the name.
  games.forEach((game) => print(game.name));
  */

  SteamGame test = SteamGame("Elden Ring");
  GameHoursGetter test1 = GameHoursGetter(test);
  test1.addHoursToGame();


}
