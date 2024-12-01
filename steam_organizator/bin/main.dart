//import 'package:steam_game_organizer/steam_game_organizer.dart' as steam_game_organizer;
import '../lib/steam_http.dart' as steamHttp;
void main() {
  steamHttp.SteamCom steamCon = steamHttp.SteamCom("76561198084887486");
  steamCon.getUserGames();
}
