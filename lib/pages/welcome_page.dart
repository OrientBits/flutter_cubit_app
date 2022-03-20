import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ['welcome-one.png', 'welcome-two.png', 'welcome-three.png'];
  List colors = [Colors.indigoAccent.shade200,Colors.black,Colors.green.shade800];
  List subHading = ['Starting','Almost','Mountain'];

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
                      fit: BoxFit.cover,
                      image: AssetImage('img/' + images[index]))),

              child: Container(
                margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: 'Trips',color: colors[index],),
                        AppText(text: subHading[index],color:colors[index], size: 30),

                        const SizedBox(height: 20),

                        SizedBox(
                          width: 250,
                          child: AppText(
                            text:
                                'Mountain hikes give you an incredible sense '
                                    'of freedom along with endurance test',
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),

                        const SizedBox(height: 30),
                        ResponsiveButton(width: 120,)
                      ],
                    ),

                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          width: 8,
                          height: index==indexDots?25:8,
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
