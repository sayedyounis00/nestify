import 'package:flutter/material.dart';

class SelecUserType extends StatefulWidget {
  final bool value;
  final String text;
  final Function(bool?) onChanged;
  const SelecUserType({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  State<SelecUserType> createState() => _SelecUserTypeState();
}

class _SelecUserTypeState extends State<SelecUserType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(10)),
      child: CheckboxListTile(
          shape: const CircleBorder(),
          title: Text(widget.text),
          value: widget.value,
          onChanged: widget.onChanged),
    );
  }
}
