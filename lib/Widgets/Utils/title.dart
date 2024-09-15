import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
            left: 2.0,   
            top: 0.0,    
            right: 0.0,  
            bottom: 10.0 
        ),
        child: Text(
            'Pokedéx',
            style: TextStyle(
              fontFamily: 'MonoSans',
              fontSize: 32,
              fontWeight: FontWeight.bold),
        )
      )
    );
  }
}