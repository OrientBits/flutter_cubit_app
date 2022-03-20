import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/drawer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Map images = {
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkling'
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //menu text
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black54,
                    ),
                    onPressed: (){
                      DrawerPage();
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5)),
                  )
                ],
              ),
            ),

            const SizedBox(height: 30),
            //discover text
            Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(text: 'Discover')),
            const SizedBox(height: 20),

            //TabBar
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  controller: _tabController,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                  tabs: const [
                    Tab(text: 'Places'),
                    Tab(text: 'Inspiration'),
                    Tab(text: 'Emotions'),
                  ],
                ),
              ),
            ),

            //TabBarView
            Container(
              padding: const EdgeInsets.only(left: 20),
              width: double.maxFinite,
              height: 300,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15,top: 10,bottom: 10),
                        width: 190,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            image: const DecorationImage(
                                image: AssetImage('img/mountain.jpeg'),
                                fit: BoxFit.cover)),
                      );
                    },
                  ),

                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15,top: 10,bottom: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: const DecorationImage(
                                image: AssetImage('img/mountain.jpeg'),
                                fit: BoxFit.cover)),
                      );
                    },
                  ),

                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15,top: 10,bottom: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: const DecorationImage(
                                image: AssetImage('img/mountain.jpeg'),
                                fit: BoxFit.cover)),
                      );
                    },
                  ),
                ],
              ),
            ),


            const SizedBox(height: 30),

            //Explore more text
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(text: 'Explore more',size: 22),
                  AppText(text: 'See all',color: AppColors.textColor1,)
                ],
              ),
            ),

            const SizedBox(height: 15),

            //listview
            Container(
              height: 120,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (Context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        Container(
                          //margin: const EdgeInsets.only(right: 40),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blueGrey.withOpacity(0.2),
                              border: Border.all(color: Colors.blueGrey.withOpacity(0.2), width: 1.0),
                              image: DecorationImage(
                                image: AssetImage(
                                    'img/' + images.keys.elementAt(index)),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(height: 5),

                        Container(
                          child: AppText(
                              text: images.values.elementAt(index), color: AppColors.textColor2),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}


// for making circle indicator for TabBar
class CircleTabIndicator extends Decoration {
  late Color color;
  late double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}
class _CirclePainter extends BoxPainter {
  late Color color;
  late double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    Offset circleOffset = Offset((configuration.size!.width) / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
