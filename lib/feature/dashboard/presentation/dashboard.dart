import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gem_store/core/constants/assets.dart';
import 'package:gem_store/feature/dashboard/cubit/dashboard_cubit.dart';
import 'package:gem_store/feature/dashboard/presentation/add_to_cart.dart';
import 'package:gem_store/feature/dashboard/presentation/discover_page.dart';
import 'package:gem_store/feature/dashboard/presentation/home_page.dart';
import 'package:gem_store/feature/dashboard/presentation/setting_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    final List<Widget> screens = const [
      HomePage(),
      DiscoverPage(),
      AddToCart(),
      SettingPage(),
    ];
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            body: screens[state.index],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                border: Border.all(width: 0.1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12, // shadow color
                    spreadRadius: 0.5,
                    blurRadius: 5,
                    offset: Offset(0, -2), // negative y = shadow goes upward
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: state.index,
                onTap: (index) {
                  context.read<DashboardCubit>().changeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    label: '',
                    activeIcon: SvgPicture.asset(Assets.home_filled),
                    icon: SvgPicture.asset(Assets.home_svg),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    activeIcon: SvgPicture.asset(Assets.search_filled),
                    icon: SvgPicture.asset(Assets.search_svg),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    activeIcon: SvgPicture.asset(Assets.add_to_cart_filled),
                    icon: SvgPicture.asset(Assets.add_to_cart_svg),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    activeIcon: SvgPicture.asset(Assets.profile_filled),
                    icon: SvgPicture.asset(Assets.profile_svg),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
