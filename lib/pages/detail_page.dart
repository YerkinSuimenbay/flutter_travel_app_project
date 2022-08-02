import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_test.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/mountain.jpeg'))),
                )),
            Positioned(
                top: 50,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.abc, color: Colors.white))
                  ],
                )),
            Positioned(
                top: 300,
                child: Container(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 800, // TODO: to be corrected
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: 'Yosemite',
                            color: Colors.black54.withOpacity(.8),
                          ),
                          AppLargeText(
                            text: '\$ 250',
                            color: AppColors.mainColor,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          AppText(
                            text: 'USA, California',
                            color: AppColors.textColor1,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Icon(
                                        Icons.star,
                                        color: index < 4
                                            ? AppColors.starColor
                                            : Colors.grey,
                                      ))),
                          const SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: '(4.0)',
                            color: AppColors.textColor2,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AppLargeText(
                        text: 'People',
                        size: 20,
                      ),
                      const SizedBox(height: 5),
                      AppText(
                        text: 'Number of people in your group',
                        color: AppColors.mainTextColor,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          bool isCurrent = index == selectedIndex;
                          Color bgColor = AppColors.buttonBackground;
                          Color color = Colors.black87;
                          if (isCurrent) {
                            bgColor = Colors.black87;
                            color = Colors.white;
                          }

                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButton(
                                  color: color,
                                  text: '${index + 1}',
                                  // icon: Icons.favorite_border,
                                  // isIcon: true,
                                  bgColor: bgColor,
                                  borderColor: bgColor,
                                  size: 50),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppLargeText(
                        text: 'Description',
                        color: Colors.black.withOpacity(.8),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text:
                            'Yosemite National Park is located in central Sierra Nevada in the US state of California. Is is located near the wild protected areas.',
                        color: AppColors.mainTextColor,
                      ),
                    ],
                  ),
                )),
            Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButton(
                      color: AppColors.textColor1,
                      bgColor: Colors.white,
                      borderColor: AppColors.textColor1,
                      size: 55,
                      icon: Icons.favorite_border,
                      isIcon: true,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const ResponsiveButton(
                      isResponsive: true,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
