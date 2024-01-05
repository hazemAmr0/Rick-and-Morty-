import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/characters.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;
  const CharactersDetailsScreen( {super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     backgroundColor:  Colors.teal.shade900,
body: CustomScrollView(
  slivers: [
    buildsliverAooBar(),
    SliverList(delegate: SliverChildListDelegate(
      [
        Container(
          margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:  Colors.teal.shade900,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
CharacterInfo('Name', character.name),
BuildDivider(315),
CharacterInfo('Status', character.status),
                  BuildDivider(270),
                  CharacterInfo('Species', character.species),
                  BuildDivider(280),
                  CharacterInfo('Gender', character.gender),
                  BuildDivider(260),
                  CharacterInfo('Origin', character.origin.name),
                  BuildDivider(250),
                  CharacterInfo('Location', character.location.name),
                  BuildDivider(230),
                  CharacterInfo('Episodes', character.episode.length.toString()),
                  BuildDivider(290),


            
                

            ],

          ),
        ),
        SizedBox(
          height: 500,
        )
      ]
    ))
  ]
),

      );
    
  }
Widget BuildDivider(double endIndent){
return Divider(
  endIndent: endIndent,
  color:  Colors.yellow,
  thickness: 2,
  height: 20,

);
}
Widget CharacterInfo(String title,String value){
return RichText(
maxLines: 1,
overflow: TextOverflow.ellipsis,
text: TextSpan(
children: [
TextSpan(text: '$title: ',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 20,fontWeight: FontWeight.bold),),
TextSpan(text: '$value',style: TextStyle(color: Colors.black,fontSize: 18),),
]
),);


}
  Widget buildsliverAooBar(){
return SliverAppBar(
  expandedHeight: 600,
  pinned: true,
  stretch: true,
  backgroundColor:  Colors.teal.shade800,
  flexibleSpace: FlexibleSpaceBar(
    title: Text(character.name,style: TextStyle(color:Colors.black ,fontWeight: FontWeight.bold),),
    background: Hero(
      tag: character.id,
      child: Image.network(character.image,fit: BoxFit.cover,),
    ),
  ),);
  
  }
}