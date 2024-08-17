import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';

class DropDownOwner extends StatelessWidget {
  final String upText;
  final List<String> allList;
  final Function(String?) onChanged;
  final String? selectedValue;
  const DropDownOwner({
    super.key,
    required this.upText,
    required this.allList,
    required this.onChanged,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          upText.toLowerCase(),
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(139, 0, 0, 0),
          ),
          overflow: TextOverflow.ellipsis,
        ),
        items: allList
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
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          height: 53,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.withOpacity(1),
            ),
            color: Colors.transparent,
          ),
        ),
        iconStyleData: const IconStyleData(
          openMenuIcon: Icon(
            Icons.keyboard_arrow_up,
            size: 20,
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 20,
          ),
          iconSize: 14,
          iconEnabledColor: AppColor.secColor3,
          iconDisabledColor: AppColor.secColor3,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          offset: const Offset(0, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thumbVisibility: WidgetStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
