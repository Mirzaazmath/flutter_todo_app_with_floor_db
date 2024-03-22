import 'package:flutter/material.dart';
import 'package:flutter_floor_db_sample/utils/text_utils.dart';
import 'package:provider/provider.dart';

import '../floorDB/entity.dart';
import '../utils/global_class.dart';
import '../widgets/add_dailog.dart';
import '../widgets/empty_widget.dart';
import '../widgets/list_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextUtil(
          text: "To-Dos",
        ),
      ),
      body:
      Consumer<DataBaseProvider>(
        builder: (context,provider,widget){
          if(provider.doa==null){
            return const  CircularProgressIndicator();
          }else{
            return StreamBuilder<List<Task>>(
              stream: provider.doa.getAllTask(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.data==null) {
                  return const EmptyWidget();
                } else if(snapshot.data!=null&& snapshot.data!.isEmpty) {
                  return const EmptyWidget();
                }else{

                  return ListView.builder(
                    padding:const  EdgeInsets.all(10),
                    itemCount: snapshot.data?.length,
                      itemBuilder: (context,index){
                      Task task=snapshot.data![index];
                      return ListItemWidget(task:task);

                  });
                }
              },
            );
          }

          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const CustomDialogBox();
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
