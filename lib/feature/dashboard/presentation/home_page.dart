import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gem_store/core/constants/app_colors.dart';
import 'package:gem_store/core/constants/assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> icons = [
    Assets.women_svg,
    Assets.men_svg,
    Assets.accessories_svg,
    Assets.beauty_svg,
  ];
  final List<String> names = [
    'Women',
    'Men',
    'Accessories',
    'Beauty',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: SvgPicture.asset(
            Assets.menu_svg,
            height: 15,
            width: 15,
          ),
        ),
        title: Text(
          'Gemstore',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Icon(Icons.notifications_on_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 36),
          Row(
            children: List.generate(
              4,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == 0 ? Colors.white : Colors.transparent,
                        border: Border.all(
                          color: index == 0 ? AppColors.brown : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == 0 ? AppColors.brown : AppColors.lightGrey2,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            icons[index],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(names[index]),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Stack(
            children: [
              Container(
                height: 168,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage(
                        Assets.home_image,
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              Positioned(
                right: 40,
                top: 20,
                child: Text(
                  textAlign: TextAlign.left,
                  "Autumn \nCollection\n2022",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured Products',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('Show all'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
