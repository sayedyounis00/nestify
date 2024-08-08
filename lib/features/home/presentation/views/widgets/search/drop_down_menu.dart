import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';

class DropDownMenu extends StatefulWidget {
  final String upText;
  final List<String> allList;
  const DropDownMenu({super.key, required this.upText, required this.allList});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.upText,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color:
                      const Color.fromARGB(255, 117, 113, 113).withOpacity(1)),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint:  Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.upText.toLowerCase(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: widget.allList
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey.withOpacity(.3),
                    ),
                    color: Colors.white,
                  ),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 20,
                  ),
                  iconSize: 14,
                  iconEnabledColor: AppColor.secColor3,
                  iconDisabledColor: AppColor.secColor3,
                ),
                dropdownStyleData: DropdownStyleData(
                  // maxHeight: 200,
                  // width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  offset: const Offset(0, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    // thickness: WidgetStateProperty.all<double>(6),
                    thumbVisibility: WidgetStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
