
import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/data/web_services/charcters_web_serviceses.dart';

class CharacterRepository{
  final CharacterWebServices characterWebServices;
  CharacterRepository({required this.characterWebServices});

  Future<List<Character>> getAllCharacters()async{
    final characters = await characterWebServices.getAllCharacters();
    return characters.map((character) => Character.fromJson( character)).toList();
  }



}