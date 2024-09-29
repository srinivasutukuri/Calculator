import 'package:calculater_2/contains/colors.dart';
import 'package:calculater_2/contains/fonts.dart';
import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  const Inputfield({
    super.key,
    required this.title,
    this.titlecontroler,
  });

  final TextEditingController? titlecontroler;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titlecontroler,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(
          fontFamily: jost,
          fontWeight: FontWeight.normal,
          color: AppColors.grey,
          fontSize: 16,
        ),
      ),
    );
  }
}
