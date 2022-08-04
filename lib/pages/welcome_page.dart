// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_test.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
    'snorkling.png',
    'mountain.jpeg',
    'kayaking.png',
    'hiking.png',
    'button-one.png',
    'balloning.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/${images[index]}'),
                        fit: BoxFit.cover)),
                child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: "Trip"),
                          AppText(
                            text: "Mountain",
                            size: 30,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            child: AppText(
                              text:
                                  "Mountain hikes give you an incredible sense of freedom along with endurance tests",
                              color: AppColors.textColor2,
                              size: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context).getData();
                            },
                            child: Container(
                              width: 200,
                              child: const ResponsiveButton(
                                width: 120,
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: List.generate(3, (listIndex) {
                          bool isCurrent = listIndex == index;
                          double height = 10;
                          Color color = AppColors.mainColor.withOpacity(.3);
                          if (isCurrent) {
                            height = 25;
                            color = AppColors.mainColor;
                          }
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: height,
                            decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(8)),
                          );
                        }),
                      )
                    ],
                  ),
                ));
          }),
    );
  }
}
