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
  final bool? isEdit;
  final Task? task;
  const CustomDialogBox({
    super.key,
    this.isEdit,
    this.task

  });

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  TextEditingController taskNameController=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.isEdit==true){
      taskNameController.text=widget.task!.name;
    }
  }
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
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(Constants.padding),
            border: Border.all(color: Colors.grey)

          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               Center(
                child: TextUtil(text:widget.isEdit==true?"Edit Task": "Add Task",size: 22,),
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
                    title:widget.isEdit==true?"Update": 'Save',
                    onTap: () async{
                      if(taskNameController.text==""){
                        showToast("Please Enter Task Name");
                      }else{

                        final task = widget.isEdit==true?Task.optional(id: widget.task!.id,name: taskNameController.text, isCompleted: false):Task.optional(name: taskNameController.text, isCompleted: false);
                        var value=  widget.isEdit==true?await Provider.of<DataBaseProvider>(context,listen: false).doa!.updateTask(task): await Provider.of<DataBaseProvider>(context,listen: false).doa!.insertTask(task);
                        if(value.runtimeType==int){
                          Navigator.pop(context);
                          showToast( widget.isEdit==true?"Task Updated":"Task Added");
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
              child:  Icon(

              widget.isEdit==true?Icons.edit:  Icons.check_circle_outline_outlined,
                size:widget.isEdit==true?40: 60,
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
