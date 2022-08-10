import 'package:flutter/material.dart';

import '../color.dart';

class Textfield extends StatelessWidget {
  // ignore: non_constant_identifier_names

  String textfieldlabel;
  TextInputType? type;
  IconButton? suffix;
  bool? enable;

  TextEditingController controller;

  // ignore: non_constant_identifier_names
  Textfield(
      {Key? key,
      required this.controller,
      required this.textfieldlabel,
      this.type,
      this.enable,
      this.suffix})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      controller: controller,
      validator: (value) {
        if (value!.length == 0) {
          return 'you must fill this field';
        }
      },
      keyboardType: type,
      decoration: InputDecoration(
          suffixIcon: suffix,
          label: Text(
            textfieldlabel,
            style: const TextStyle(color: Colors.grey),
          ),
          filled: true,
          fillColor: HexColore.fromHex('F1F6FB'),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5))),
    );
  }
}
