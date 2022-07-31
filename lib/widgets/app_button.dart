import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color bgColor;
  double size;
  final Color borderColor;

  String text;

  AppButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.bgColor,
      required this.borderColor,
      required this.size})
      : super(key: key);

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
        child: AppText(
          text: text,
          color: color,
        ),
      ),
    );
  }
}
