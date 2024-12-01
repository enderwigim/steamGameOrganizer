import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:steam_organizator/steam_game.dart';

class GameHoursGetter {
  SteamGame game;

  GameHoursGetter(this.game);

  Future<void> addHoursToGame() async {
    // Create url
    final url = "https://www.howlongtobeat.com/?q=${game.name!.replaceAll(" ", "%2520")}"; 
    print(url);

    // MAKE HTTP REQUEST GET
    final response = await http.get(Uri.parse(url),
                                    headers: {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
    });
    if (response.statusCode == 200) {
      final document = parse(response.body);

      print("Acepted");
      // GET data with css selectors
      final gameData = document.querySelector('.GameCard_search_list_tidbit__0r_OP.center.time_100');
      
      if (gameData != null) {
         print('Contenido encontrado: ${gameData.text}');
      } else {
        print('No se encontró el elemento.');
      }
      }
      else {
        print("ERROR ${response.statusCode}");
      }
    
  }
}