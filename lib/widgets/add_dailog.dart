import 'package:flutter/material.dart';
import 'package:flutter_floor_db_sample/utils/global_class.dart';
import 'package:flutter_floor_db_sample/utils/text_field_utlis.dart';
import 'package:flutter_floor_db_sample/utils/text_utils.dart';
import 'package:flutter_floor_db_sample/utils/toast_utils.dart';
import 'package:provider/provider.dart';
import '../floorDB/entity.dart';
import 'border_btn.dart';
import 'color_btn.dart';

// CUSTOM DAILOG CLASS
class CustomDialogBox extends StatefulWidget {
  const CustomDialogBox({
    super.key,
  });

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  TextEditingController taskNameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
            border: Border.all(color: Colors.grey)

          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Center(
                child: TextUtil(text: "Add Task",size: 22,),
              ),
              const  SizedBox(height: 20,),
              Field(controller: taskNameController, hintText: "Task Name"),
             const  SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BorderBtn(
                    width: 100,
                    title: 'Cancel',
                    onTap: () {
                      Navigator.pop(context);
                    },),
                  ColorBtn(
                    width: 100,
                    color: Colors.white,
                    title: 'Save',
                    onTap: () async{
                      if(taskNameController.text==""){
                        showToast("Please Enter Task Name");
                      }else{
                        final task = Task.optional(name: taskNameController.text, isCompleted: false);
                        var value=await Provider.of<DataBaseProvider>(context,listen: false).doa!.insertTask(task);
                        if(value.runtimeType==int){
                          Navigator.pop(context);
                          showToast("Task Added");
                        }else{
                          showToast("Something Went Wrong");
                        }
                      }
                    },

                  )
                ],
              )





            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColorDark,
              radius: 50,
              child:const  Icon(

                Icons.check_circle_outline_outlined,
                size: 60,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
