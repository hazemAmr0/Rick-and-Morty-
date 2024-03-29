import 'package:flutter/material.dart';
import '../../constants/strings.dart';
import '../../data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 150, 158, 158),
        borderRadius: BorderRadius.circular(7),
      ),
      child: InkWell(
        onTap: ()=>Navigator.pushNamed(context, CharacterDetails,arguments: character),
        child: GridTile(
          child: Hero(
            tag: character.id,
            child: Container(
              color: Colors.grey,
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.gif',
                      image: character.image,
                      fit: BoxFit.cover,
                    )
                  : const Center(
                      child: Icon(Icons.image),
                    ),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              character.name,
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                 ),
                 overflow: TextOverflow.ellipsis,
                 maxLines: 2,
                 textAlign: TextAlign.center,
                 
              
            
             
            )
          )
        ),
      ),
    );
  }
}
