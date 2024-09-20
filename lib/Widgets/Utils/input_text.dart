import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  const InputText({
    Key? key,
  }): super(key: key);

  @override
  InputTextState createState() => InputTextState();
}

class InputTextState extends State<InputText> {
  String? _input = "";

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        decoration: 
          BoxDecoration(
            color: const Color(0xFFE3F2FD),
            borderRadius: BorderRadius.circular(12.0),
          ),
        child:
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
              left: 10,
              right: 10
            ),
            child:  
              TextField(
                onChanged: (text) {
                  setState(() {
                    _input = text;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 99, 99, 99)),
                  hintText: "${(_input == "") ? "Insira o nome de um pokemon" : _input}",
                  border: InputBorder.none
                ),
                style: 
                  const TextStyle(
                    color:  Color.fromARGB(255, 99, 99, 99),
                    fontFamily: 'MonoSans',
                    fontSize: 14,
                  )
              ),
          ),
      );
  }
}