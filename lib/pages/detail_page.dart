import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
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
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is DetailState) {
        final place = state.place;

        return Container(
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
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            // image: AssetImage('images/mountain.jpeg'))),
                            image: NetworkImage('http://mark.bslmeiyu.com/uploads/' + place.img))),
                  )),
              Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
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
                    padding:
                        const EdgeInsets.only(top: 30, left: 20, right: 20),
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
                              text: place.name,
                              color: Colors.black54.withOpacity(.8),
                            ),
                            AppLargeText(
                              text: '\$ ${place.price}',
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
                              text: place.location,
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
                                          color: index < place.stars
                                              ? AppColors.starColor
                                              : Colors.grey,
                                        ))),
                            const SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: '(${place.stars}.0)',
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
                              place.description,
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
        );
      }

      return Container();
    }));
  }
}
