import 'package:flutter/material.dart';

class textFormField{
  
   textformfield({controller, labeltext, onchange}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      labelText: labeltext,
    ),
    onChanged: onchange,
  );
}
}