import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gem_store/core/constants/app_colors.dart';
import 'package:gem_store/core/constants/assets.dart';
import 'package:gem_store/core/extension/extension.dart';
import 'package:gem_store/feature/dashboard/cubit/featured_product/featured_product_cubit.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart'
//     show SmoothPageIndicator, CustomizableEffect, DotDecoration;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();

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
  final List<String> styleNames = [
    'The\nOffice\nLife',
    'The\nElegant\ndesign',
  ];
  final List<String> title = [
    'T-Shirts',
    'Dresses',
  ];
  final List<String> images = [Assets.office_life, Assets.elegant_design];
  final List<String> carouselImages = [Assets.home_image, Assets.featured_1, Assets.featured_2];

  @override
  void initState() {
    super.initState();
    context.read<FeaturedProductCubit>().getFeaturedProducts();
    context.read<FeaturedProductCubit>().getRecommendedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
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
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  PageView(
                    controller: _controller,
                    children: List.generate(
                      carouselImages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 22),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(
                              carouselImages[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Text
                  const Positioned(
                    right: 40,
                    top: 20,
                    child: Text(
                      "Autumn \nCollection\n2022",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Indicator
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 20,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (_, __) {
                        final page = (_controller.hasClients && _controller.page != null)
                            ? _controller.page!
                            : _controller.initialPage.toDouble();
                        final activeIndex = page.round();

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(3, (i) {
                            final isActive = i == activeIndex;

                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: isActive
                                  ? Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 3),
                                      ),
                                      child: Center(
                                        child: Container(
                                          width: 8,
                                          height: 8,
                                          decoration: const BoxDecoration(
                                            color: Colors.white, // inner filled dot
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 10,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ],
              ),
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
            SizedBox(height: 20),
            SizedBox(
              height: 230,
              child: BlocBuilder<FeaturedProductCubit, FeaturedProductState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.featuredProduct.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Container(
                              height: 172,
                              width: 126,
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey2,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                    state.featuredProduct[index].image,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            state.featuredProduct[index].name,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "\$ ${state.featuredProduct[index].price.toString()}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Image.asset(Assets.home_banner),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('Show all'),
                ],
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 80,
              child: BlocBuilder<FeaturedProductCubit, FeaturedProductState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.recommendedProduct.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 70,
                            width: 250,
                            alignment: AlignmentDirectional.centerStart,
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  state.recommendedProduct[index].image,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      state.recommendedProduct[index].name,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      "\$ ${state.recommendedProduct[index].price.toString()}",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Collection',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('Show all'),
                ],
              ),
            ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Image.asset(Assets.top_collection_1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Image.asset(Assets.top_collection_2),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 194,
                          width: context.width * 0.4,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            color: Color(0xffF8F8FA),
                            border: Border.all(
                              color: Colors.grey.shade200,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                alignment: AlignmentGeometry.center,
                                children: [
                                  Image.asset(
                                    height: 194,
                                    width: 110,
                                    images[0],
                                    fit: BoxFit.contain,
                                  ),
                                  Positioned(
                                    right: -30,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          title[0],
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: AppColors.dardGrey,
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          styleNames[0],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 194,
                          width: context.width * 0.4,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            color: Color(0xffF8F8FA),
                            border: Border.all(
                              color: Colors.grey.shade200,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                alignment: AlignmentGeometry.center,
                                children: [
                                  Positioned(
                                    left: -45,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          title[1],
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: AppColors.dardGrey,
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          styleNames[1],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    height: 194,
                                    width: 110,
                                    images[1],
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
