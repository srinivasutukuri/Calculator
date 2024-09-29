import 'package:calculater_2/contains/colors.dart';
import 'package:calculater_2/contains/fonts.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.title, this.ontap, this.lagre = true});
  final String title;
  final VoidCallback? ontap;
  final bool lagre;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.translucentPeriwinkle,
        ),
        child: Center(
          child: Text(
            title,
            style: lagre
                ? TextStyle(
                    fontFamily: jost,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                    fontSize: 20,
                  )
                : TextStyle(
                    fontFamily: jost,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white,
                    fontSize: 15,
                  ),
          ),
        ),
      ),
    );
  }
}
