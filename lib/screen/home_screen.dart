import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_app/controller/home_controller.dart';
import 'package:practical_app/model/product_model.dart';
import 'package:practical_app/widget/triangle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            runSpacing: 10,
            spacing: 10,
            children:
                List.generate(homeController.productsList.length, (index) {
              if (index % 3 == 0) {
                List<Product> sublist = [];
                if (homeController.productsList.length < index + 3) {
                  sublist = homeController.productsList.sublist(index);
                } else {
                  sublist =
                      homeController.productsList.sublist(index, index + 3);
                }
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        sublist.length,
                        (i) => InkWell(
                          onTap: () {
                            homeController.updateIndex(index);
                          },
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width / 3.5,
                            color: Colors.blue,
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: sublist[i].imgUrl ?? "",
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          sublist[i].name ?? "",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        homeController.selectedIndex.value ==
                                                index
                                            ? Icons.keyboard_arrow_down
                                            : Icons.keyboard_arrow_up,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (homeController.selectedIndex.value == index)
                      _buildDetailsWidget(),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ),
        );
      }),
    );
  }

  Widget _buildDetailsWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.blue.withOpacity(0.2),
        child: Column(
          children: [
            CustomPaint(
              painter: Triangle(
                Colors.blue.withOpacity(0.2),
              ),
            ),
            ListView.separated(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  dense: true,
                  title: Text(homeController.subList[index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(endIndent: 10);
              },
              itemCount: homeController.subList.length,
            ),
          ],
        ),
      ),
    );
  }
}
