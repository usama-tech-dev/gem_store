import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gem_store/core/constants/app_colors.dart';
import 'package:gem_store/core/constants/assets.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      Assets.search_1,
      Assets.search_2,
      Assets.search_3,
      Assets.search_4,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Icon(Icons.menu),
        ),
        title: Text(
          'Discover',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Icon(Icons.notifications_on_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                        color: AppColors.searchContainer,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                          ),
                        ]),
                    child: Row(
                      children: [
                        SizedBox(width: 30),
                        Icon(CupertinoIcons.search),
                        SizedBox(width: 10),
                        Text(
                          "Search",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 56,
                    width: 46,
                    decoration: BoxDecoration(
                        color: AppColors.searchContainer,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                          ),
                        ]),
                    child: Icon(CupertinoIcons.selection_pin_in_out),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: images.length,
                padding: EdgeInsets.only(top: 28),
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Image.asset(
                    images[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
