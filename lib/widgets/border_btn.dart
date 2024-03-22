import 'package:flutter/material.dart';
import '../../../utils/text_utils.dart';
class BorderBtn extends StatelessWidget {
  final String title;
  final  VoidCallback onTap;
  final double? width;
  final Color? color;
  const BorderBtn({super.key,required this.title, required this.onTap,this.width,this.color});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width:width?? double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:Theme.of(context).primaryColorLight,
            side: const BorderSide(color: Colors.grey),
          ),
          onPressed: onTap,
          child: TextUtil(text: title,size: 14,)),
    );


  }
}