import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/home/data/model/home_data.dart';
import 'package:nestify/features/home/presentation/views/widgets/drop_down_menu.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 120, horizontal: 40),
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.2,
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
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomButton(
              text: 'Search',
              color: AppColor.primaryColor,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
