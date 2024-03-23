import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Field extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? isNumberType;
  final bool? isEnable;
  final int? maxLine;

  const Field(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isNumberType,
      this.isEnable,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Theme.of(context).primaryColor),
      readOnly: isEnable ?? false,
      maxLines: maxLine ?? 1,
      controller: controller,
      keyboardType:
          isNumberType == true ? TextInputType.number : TextInputType.name,
      inputFormatters:
          isNumberType == true ? [FilteringTextInputFormatter.digitsOnly] : [],
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Theme.of(context).primaryColorDark),
          hintStyle: TextStyle(color: Theme.of(context).primaryColor),
          hintText: hintText,
          labelText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
                width: 1,
                color: isEnable == true
                    ? Colors.grey
                    : Theme.of(context).primaryColorDark),
          ),
          border: const OutlineInputBorder()),
    );
  }
}
