
import 'package:flutter/material.dart';

class TextUtil extends StatelessWidget {
  final  String text;
  final  double? size;
  final Color?color;
  final  bool? weight;
  const   TextUtil({super.key,required this.text,this.size,this.weight,this.color});

  @override
  Widget build(BuildContext context) {
    return  Text(text,

      style: TextStyle(color:color??Theme.of(context).primaryColor,fontSize:size?? 18,
          fontWeight:weight==null?FontWeight.w500: FontWeight.w700,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}