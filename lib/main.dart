import 'package:flutter/material.dart';
import 'package:rick_and_morty/app_router.dart';

void main() {
  runApp( rick_and_morty( apprRouter: AppRouter()));
}

class rick_and_morty extends StatelessWidget {
   final AppRouter apprRouter;

  const rick_and_morty({super.key, required this.apprRouter});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     onGenerateRoute: apprRouter.generateRoute,
   
      
    );
  }
}

