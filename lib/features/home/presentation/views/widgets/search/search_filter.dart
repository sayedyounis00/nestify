import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/home/data/home_data.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/home/presentation/views/widgets/search/drop_down_menu.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({
    super.key,
  });

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  CrossFadeState animation = CrossFadeState.showFirst;
  bool isClosed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120, right: 25, left: 25),
      child: AnimatedCrossFade(
        crossFadeState: animation,
        duration: const Duration(milliseconds: 300),
        firstChild: Card(
          shape: const CircleBorder(),
          color: Colors.white,
          shadowColor: const Color.fromARGB(255, 255, 255, 255),
          child: IconButton(
            onPressed: () {
              animation = CrossFadeState.showSecond;
              isClosed = false;
              setState(() {});
            },
            icon: const Icon(
              Icons.search,
              color: AppColor.primaryColor,
              size: 30,
            ),
          ),
        ),
        secondChild: isClosed
            ? const SpaceH(0)
            : Card(
                color: Colors.white,
                shadowColor: const Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        color: AppColor.primaryColor,
                        onPressed: (){
                          BlocProvider.of<HomeCubit>(context)
                              .filterdHousesList = [];
                          BlocProvider.of<HomeCubit>(context).getHousesData();
                          animation = CrossFadeState.showFirst;
                          isClosed = true;
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
        width: double.infinity,
        text: 'Search',
        color: AppColor.primaryColor,
        onPressed: () {
          BlocProvider.of<HomeCubit>(context)
              .setFilterdHouses(loca: 'tanta', bed: 'd');
        },
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
          crossAxisCount: 2,
          mainAxisExtent: 82,
        ),
        itemBuilder: (context, index) => DropDownMenu(
          upText: HomeData.upText[index],
          allList: HomeData.wholeList[index],
        ),
        itemCount: HomeData.upText.length,
      ),
    );
  }
}
