import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gem_store/core/constants/app_colors.dart';
import 'package:gem_store/core/constants/assets.dart';
import 'package:gem_store/core/extension/extension.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int _expandedIndex = -1;

  final List<Category> categories = [
    Category(
      title: "Clothing",
      image: Assets.search_1,
      subCategories: [
        SubCategory(name: "Jacket", items: 128),
        SubCategory(name: "Skirts", items: 40),
        SubCategory(name: "Dresses", items: 36),
        SubCategory(name: "Sweaters", items: 24),
        SubCategory(name: "Jeans", items: 14),
        SubCategory(name: "T-Shirts", items: 12),
        SubCategory(name: "Pants", items: 9),
      ],
    ),
    Category(
      title: "Accessories",
      image: Assets.search_2,
      subCategories: [
        SubCategory(name: "Jacket", items: 128),
        SubCategory(name: "Skirts", items: 40),
        SubCategory(name: "Dresses", items: 36),
        SubCategory(name: "Sweaters", items: 24),
        SubCategory(name: "Jeans", items: 14),
        SubCategory(name: "T-Shirts", items: 12),
        SubCategory(name: "Pants", items: 9),
      ],
    ),
    Category(
      title: "Shoes",
      image: Assets.search_3,
      subCategories: [
        SubCategory(name: "Jacket", items: 128),
        SubCategory(name: "Skirts", items: 40),
        SubCategory(name: "Dresses", items: 36),
        SubCategory(name: "Sweaters", items: 24),
        SubCategory(name: "Jeans", items: 14),
        SubCategory(name: "T-Shirts", items: 12),
        SubCategory(name: "Pants", items: 9),
      ],
    ),
    Category(
      title: "Collection",
      image: Assets.search_4,
      subCategories: [
        SubCategory(name: "Jacket", items: 128),
        SubCategory(name: "Skirts", items: 40),
        SubCategory(name: "Dresses", items: 36),
        SubCategory(name: "Sweaters", items: 24),
        SubCategory(name: "Jeans", items: 14),
        SubCategory(name: "T-Shirts", items: 12),
        SubCategory(name: "Pants", items: 9),
      ],
    ),
  ];

  void _toggleExpand(int index) {
    setState(() {
      if (_expandedIndex == index) {
        _expandedIndex = -1;
      } else {
        _expandedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Icon(Icons.menu),
        ),
        title: const Text(
          'Discover',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Icon(Icons.notifications_on_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
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
                      ],
                    ),
                    child: const Row(
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
                const SizedBox(width: 20),
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
                      ],
                    ),
                    child: const Icon(CupertinoIcons.selection_pin_in_out),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (_, index) {
                  final category = categories[index];
                  final isExpanded = _expandedIndex == index;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => _toggleExpand(index),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Stack(
                            children: [
                              Image.asset(
                                category.image,
                              ),
                              Positioned(
                                left: context.width * .06,
                                right: 0,
                                top: context.height * .065,
                                child: Text(
                                  category.title.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isExpanded && category.subCategories.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: List.generate(category.subCategories.length, (i) {
                              final sub = category.subCategories[i];
                              return Column(
                                children: [
                                  ListTile(
                                    dense: true,
                                    title: Text(sub.name),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("${sub.items} Items"),
                                        const Icon(Icons.arrow_forward_ios, size: 14),
                                      ],
                                    ),
                                  ),
                                  if (i != category.subCategories.length - 1)
                                    Divider(
                                      indent: 15,
                                      endIndent: 25,
                                      thickness: 0.8,
                                      color: Colors.grey.shade300,
                                    ),
                                ],
                              );
                            }),
                          ),
                        ),
                    ],
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

// Data Models
class Category {
  final String title;
  final String image;
  final List<SubCategory> subCategories;

  Category({
    required this.title,
    required this.image,
    this.subCategories = const [],
  });
}

class SubCategory {
  final String name;
  final int items;

  SubCategory({required this.name, required this.items});
}
