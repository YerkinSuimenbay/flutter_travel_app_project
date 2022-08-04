import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_test.dart';
import 'package:travel_app/widgets/app_text.dart';

double marginLeft = 20;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
    "balloning.png": "Balloning"
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is LoadedState) {
        final info = state.places;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 70, left: marginLeft, right: marginLeft),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black54,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.only(left: marginLeft),
                child: AppLargeText(text: 'Discover')),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: const CircleTabIndicator(
                      color: AppColors.mainColor, radius: 4),
                  // indicatorPadding: EdgeInsets.only(top: 40),
                  tabs: const [
                    Tab(
                      text: 'Places',
                    ),
                    Tab(
                      text: 'Inspiration',
                    ),
                    Tab(
                      text: 'Emotions',
                    )
                  ]),
            ),
            Container(
              margin: EdgeInsets.only(left: marginLeft, top: 10),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(controller: _tabController, children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: info.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                      },
                      child: Container(
                        width: 200,
                        height: 300, // same as parent HEIGHT
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                // image: AssetImage("images/mountain.jpeg"))),
                                image: NetworkImage('http://mark.bslmeiyu.com/uploads/' + info[index].img))),
                      ),
                    );
                  },
                ),
                Text('Inspiration'),
                Text('Emotions'),
              ]),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, left: marginLeft, right: marginLeft),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppLargeText(
                    text: 'Explore more',
                    size: 22,
                  ),
                  AppText(
                    text: 'See all',
                    color: AppColors.textColor1,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: marginLeft),
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'images/${images.keys.elementAt(index)}'))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppText(
                          text: images.values.elementAt(index),
                          color: AppColors.textColor2,
                          size: 13,
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
      }
      return Container();
    }));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2, configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
