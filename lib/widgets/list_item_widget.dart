import 'package:flutter/material.dart';
import 'package:flutter_floor_db_sample/utils/text_utils.dart';
import 'package:provider/provider.dart';

import '../floorDB/entity.dart';
import '../utils/global_class.dart';
import '../utils/toast_utils.dart';
import 'add_dailog.dart';

class ListItemWidget extends StatelessWidget {
  final Task task;
  const ListItemWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      /// Dismissible Widget
      child: Dismissible(
        //Here we are Providing the Key
        key: Key('${task.hashCode}'),

        /// For Updating the Task as Completed
        background: Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green,
          ),
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.task_alt,
                color: Colors.white,
              )),
        ),

        /// For Deleting the Task from Database
        secondaryBackground: Container(
          padding: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          child: const Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              )),
        ),

        /// Defining the Scroll direction for Dismiss
        direction: DismissDirection.horizontal,

        /// Upper Child Widget that displays to user as UI of Task
        child: GestureDetector(
          onLongPress: (){
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  // Custom Dialog to Add Task
                  return CustomDialogBox(isEdit: true,task: task,);
                });

          },
          child: Container(
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColorLight),
            child: ListTile(
              leading: Radio<bool>(
                value: task.isCompleted,
                onChanged: (value) async {

                  final updatedTask = Task.optional(
                      id: task.id,
                      name: task.name,
                      isCompleted: !task.isCompleted);
                  var value =
                      await Provider.of<DataBaseProvider>(context, listen: false)
                          .doa!
                          .updateTask(updatedTask);
                  if (value.runtimeType == int) {
                    showToast("Task Completed");
                  } else {
                    showToast("Something Went Wrong");
                  }
                },
                groupValue: true,
              ),
              title: TextUtil(text: task.name),
            ),
          ),
        ),

        /// Here we are performing the action based on direction
        confirmDismiss: (direction) async {
          switch (direction) {
            // To Delete
            case DismissDirection.endToStart:
              var value =
                  await Provider.of<DataBaseProvider>(context, listen: false)
                      .doa!
                      .deleteTask(task);
              if (value.runtimeType == int) {
                showToast("Task Deleted");
              } else {
                showToast("Something Went Wrong");
              }
              break;
            // To Update as Completed
            case DismissDirection.startToEnd:
              final updatedTask = Task.optional(
                  id: task.id, name: task.name, isCompleted: true);
              var value =
                  await Provider.of<DataBaseProvider>(context, listen: false)
                      .doa!
                      .updateTask(updatedTask);
              if (value.runtimeType == int) {
                showToast("Task Completed");
              } else {
                showToast("Something Went Wrong");
              }

              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
