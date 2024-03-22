import 'package:flutter/material.dart';
import 'package:flutter_floor_db_sample/utils/text_utils.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1.3,
            child: Image.asset("assets/no_data.png")),
       const  TextUtil(text: "No Data Found",size: 22,),
      ],
    );
  }
}
