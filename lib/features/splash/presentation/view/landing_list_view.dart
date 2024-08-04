import 'package:flutter/material.dart';
import 'package:nestify/core/utils/constant.dart';
import 'package:nestify/features/splash/presentation/view/landing_page.dart';

class LandingListView extends StatefulWidget {
  const LandingListView({super.key});

  @override
  State<LandingListView> createState() => _LandingListViewState();
}

class _LandingListViewState extends State<LandingListView> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) {
        AppConstInt.currentPage = value;
        setState(() {});
      },
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: AppImageList.imgList.length,
      itemBuilder: (BuildContext context, int index) {
        return Stack(children: [
          LandingPage(
            assetIamge: AppImageList.imgList[index],
            imgList: AppImageList.imgList,
            pageController: _pageController,
            title: ApppStringList.titleList[index],
            subTitle: ApppStringList.subTitle[index],
          ),
        ]);
      },
    );
  }
}
