import 'dart:convert';
import 'package:context_app/models/distance_model.dart';
import 'package:http/http.dart' as http;

class WordService {

  Future<Distance> getDistance(String word) async {
    final wordToSend = word.trim();
    final url = Uri.parse('https://api.contexto.me/machado/pt-br/game/${getGameId()}/$wordToSend');
    final result = await http.get(url);
    final decoded = jsonDecode(result.body);
    if (result.statusCode == result.statusCode.clamp(200, 299)) {
      // sucesso
      final distanceDecoded = decoded["distance"];
      final Distance distance = Distance(distance: distanceDecoded, word: decoded["word"]);
      return distance;
    } else {
      return Distance(distance: -1, word: word);
    }
  }

  Future<Distance> getTip(int distance) async {
    final url = Uri.parse(
        'https://api.contexto.me/machado/pt-br/tip/${getGameId()}/${distance.toString()}');
    final result = await http.get(url);
    final decoded = jsonDecode(result.body);
    if (result.statusCode == result.statusCode.clamp(200, 299)) {
      // sucesso
      final distanceDecoded = decoded["distance"];
      final Distance distance =
          Distance(distance: distanceDecoded, word: decoded["word"]);
      return distance;
    } else {
      return Distance(distance: -1, word: '');
    }
  }

  String getGameId() {
    final initialDate = DateTime(2022, 2, 23);
    final currentDate = DateTime.now();
    return (currentDate.difference(initialDate).inDays - 1).toString() ;
  }

  bool isValid(int distance) {
    return distance >= 0;
  }
}