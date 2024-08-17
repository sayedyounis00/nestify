import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
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
  List<String> upText = const [
    'Locations',
    'Price Range',
    'Type',
    'Bed',
  ];
  List wholeList = const [
    [
      'Egypt',
      'Usa',
      'Tanta',
      'Alex',
      'Sharm',
    ],
    [
      '1000',
      '2000',
      '3000',
      '4000',
      '5000',
    ],
    ['Villa', 'House', 'Hotel', 'Tent', 'Camp'],
    [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
    ],
  ];
  static String? selectedLoc;
  static String? selectedPrice;
  static String? selectedType;
  static String? selectedBedNum;

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
                        onPressed: () {
                          BlocProvider.of<HomeCubit>(context)
                              .filterdHousesList = [];
                          selectedLoc = null;
                          selectedPrice = null;
                          selectedType = null;
                          selectedBedNum = null;
                          animation = CrossFadeState.showFirst;
                          isClosed = true;
                          setState(() {});
                        },
                        icon: const Icon(Icons.close_rounded)),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: DropDownMenu(
                                selectedValue: selectedLoc,
                                upText: upText[0],
                                allList: wholeList[0],
                                onChanged: (String? value) {
                                  selectedLoc = value!;
                                  setState(() {});
                                },
                              ),
                            ),
                            Expanded(
                              child: DropDownMenu(
                                selectedValue: selectedPrice,
                                onChanged: (String? value) {
                                  selectedPrice = value!;
                                  setState(() {});
                                },
                                upText: upText[1],
                                allList: wholeList[1],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DropDownMenu(
                                selectedValue: selectedType,
                                onChanged: (String? value) {
                                  selectedType = value!;
                                  setState(() {});
                                },
                                upText: upText[2],
                                allList: wholeList[2],
                              ),
                            ),
                            Expanded(
                              child: DropDownMenu(
                                selectedValue: selectedBedNum,
                                onChanged: (String? value) {
                                  selectedBedNum = value!;
                                  setState(() {});
                                },
                                upText: upText[3],
                                allList: wholeList[3],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CustomButton(
                        width: double.infinity,
                        text: 'Search',
                        color: AppColor.primaryColor,
                        onPressed: () {
                          BlocProvider.of<HomeCubit>(context).setFilterdHouses(
                            loca: selectedLoc,
                            bed: selectedBedNum,
                            price: selectedPrice,
                            type: selectedType,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

// ! this is gid view as a comment don't remove
// class FilterGridView extends StatelessWidget {
//   const FilterGridView({
//     super.key,
//     required this.upText,
//     required this.wholeList,
//   });
//   final List upText;
//   final List wholeList;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .2,
//           child: GridView.builder(
//             physics: const NeverScrollableScrollPhysics(),
//             padding: const EdgeInsets.symmetric(vertical: 5),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisExtent: 82,
//             ),
//             itemBuilder: (context, index) => DropDownMenu(
//               upText: upText[index],
//               allList: wholeList[index],
//               selectedValue: selectedBedNum,
//               onChanged: (String? value) {
//                 selectedBedNum = value!;
//               },
//             ),
//             itemCount: upText.length,
//           ),
//         ),
//       ],
//     );
//   }
// }
