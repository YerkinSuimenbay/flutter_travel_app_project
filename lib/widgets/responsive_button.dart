import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  const ResponsiveButton({Key? key, this.isResponsive = false, this.width = 120})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
    List<Widget> children = [Image.asset('images/button-one.png')];
    double width_ = width!;
    if (isResponsive == true) {
      width_ = double.maxFinite;
      mainAxisAlignment = MainAxisAlignment.spaceBetween;
      children.insert(
          0,
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: AppText(
                text: 'Book Trip Now',
                color: Colors.white,
              )));
    }
    return Flexible(
      child: Container(
        width: width_,
        height: 60,
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: children,
        ),
      ),
    );
  }
}
