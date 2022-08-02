import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color bgColor;
  final double size;
  final Color borderColor;

  String? text;
  bool? isIcon;
  IconData? icon;

  AppButton({
    Key? key,
    required this.color,
    required this.bgColor,
    required this.borderColor,
    required this.size,
    this.text = 'Hi',
    this.isIcon = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      // margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor, width: 1)),
      child: Center(
        child: isIcon == false
            ? AppText(
                text: text!,
                color: color,
              )
            : Icon(icon, color: color),
      ),
    );
  }
}
