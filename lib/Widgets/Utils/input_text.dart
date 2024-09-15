import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String? input;

  const InputText({
    Key? key,
    required this.input,
  }): super(key: key);

  @override
  InputTextState createState() => InputTextState();
}

class InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(12.0),
      ),
      width: 500,
      padding: EdgeInsets.all(16.0),
      child: 
        Row(
          children: [
            const Icon(Icons.search),
            const SizedBox(width: 15),
            Text(
              widget.input ?? 'insira um nome',
              style: const TextStyle(
                color: Color.fromARGB(255, 99, 99, 99),
              ),
            ),
          ],
        ),
      );
  }
}