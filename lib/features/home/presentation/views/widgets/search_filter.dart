import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/home/data/model/home_data.dart';
import 'package:nestify/features/home/presentation/views/widgets/drop_down_menu.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({
    super.key,
  });

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  CrossFadeState animation = CrossFadeState.showFirst;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120, right: 25, left: 25),
      child: AnimatedCrossFade(
        crossFadeState: animation,
        duration: const Duration(milliseconds: 400),
        firstChild: Card(
          shape: const CircleBorder(),
          color: Colors.white,
          shadowColor: const Color.fromARGB(255, 255, 255, 255),
          child: IconButton(
            onPressed: () {
              animation = CrossFadeState.showSecond;
              setState(() {});
            },
            icon: const Icon(
              Icons.search,
              color: AppColor.primaryColor,
              size: 30,
            ),
          ),
        ),
        secondChild: Card(
          color: Colors.white,
          shadowColor: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  color: AppColor.primaryColor,
                  onPressed: () {
                    animation = CrossFadeState.showFirst;
                    setState(() {});
                  },
                  icon: const Icon(Icons.close_rounded)),
              const FilterGridView(),
              const SearchButt(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchButt extends StatelessWidget {
  const SearchButt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CustomButton(
        text: 'Search',
        color: AppColor.primaryColor,
        onPressed: () {},
      ),
    );
  }
}

class FilterGridView extends StatelessWidget {
  const FilterGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .2,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 82),
        itemBuilder: (context, index) => DropDownMenu(
          upText: HomeData.upText[index],
          allList: HomeData.wholeList[index],
        ),
        itemCount: HomeData.upText.length,
      ),
    );
  }
}
