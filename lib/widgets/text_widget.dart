import 'package:flutter/material.dart';

class TextWidget {
  text({data, size, weight, color, align}) {
    return Text(
      data,
      style: TextStyle(fontSize: size, fontWeight: weight, color: color),
      textAlign: align,
    );
  }
}
