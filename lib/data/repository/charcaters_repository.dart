
import '../models/characters.dart';
import '../web_services/charcters_web_serviceses.dart';

class CharacterRepository{
  final CharacterWebServices characterWebServices;
  CharacterRepository({required this.characterWebServices});

  Future<List<Character>> getAllCharacters()async{
    final characters = await characterWebServices.getAllCharacters();
    return characters.map((character) => Character.fromJson( character)).toList();
  }



}