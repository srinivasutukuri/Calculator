import 'package:calculater_2/contains/colors.dart';
import 'package:calculater_2/contains/fonts.dart';
import 'package:flutter/material.dart';

class Cappbar extends StatelessWidget implements PreferredSizeWidget {
  const Cappbar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
  });
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: jost,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
          fontSize: 24,
        ),
      ),
      actions: actions,
      backgroundColor: AppColors.translucentPeriwinkle,
      toolbarHeight: 80,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
