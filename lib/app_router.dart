import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/screens/characters_screen.dart';

class AppRouter{
Route?  generateRoute(RouteSettings settings){
switch(settings.name){
  case '/':
  return MaterialPageRoute(builder: (_)=>CharactersScreen());

  

}
}
}