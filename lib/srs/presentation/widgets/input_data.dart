import 'package:flutter/material.dart';

class InputData extends StatelessWidget {
  const InputData(
      {super.key, required this.inputName, required this.labelText});

  final TextEditingController inputName;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      style: const TextStyle(color: Colors.white),
      controller: inputName,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        fillColor: const Color(0xFF417BEA),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Color(0xFF417BEA),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Color(0xFF417BEA),
          ),
        ),
      ),
    );
  }
}
