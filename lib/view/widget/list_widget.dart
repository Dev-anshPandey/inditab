import 'package:flutter/material.dart';
import 'package:inditab_assignment/viewModel/view_model_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatelessWidget {
  ListViewModel listViewModel;
  int index;
  ListWidget({super.key,required this.listViewModel,required this.index});

  @override
  Widget build(BuildContext context) {
    
  final listViewModel=Provider.of<ListViewModel>(context, listen: false);
  print(DateFormat.LLLL().format(listViewModel.fetchedList[index].date??DateTime.now()));
    if(listViewModel.filter.isEmpty){
      return ListTile(
                      title: Text(listViewModel.fetchedList[index].title.toString(),style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.026,fontWeight: FontWeight.bold ),),
                      subtitle: Text(listViewModel.fetchedList[index].description.toString(),style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.02,fontWeight: FontWeight.normal)),
                      trailing: Text(listViewModel.fetchedList[index].date.toString(),style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.02,fontWeight: FontWeight.normal)),
                    );
    }
    else if(listViewModel.filter.contains(listViewModel.fetchedList[index].date?.day.toString()) || listViewModel.filter.contains(DateFormat.LLLL().format(listViewModel.fetchedList[index].date??DateTime.now()))  || listViewModel.filter.contains(DateFormat.E().format(listViewModel.fetchedList[index].date??DateTime.now()))){
      return ListTile(
                      title: Text(listViewModel.fetchedList[index].title.toString(),style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.026,fontWeight: FontWeight.bold ),),
                      subtitle: Text(listViewModel.fetchedList[index].description.toString(),style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.02,fontWeight: FontWeight.normal)),
                      trailing: Text(listViewModel.fetchedList[index].date.toString(),style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.02,fontWeight: FontWeight.normal)),
                    );
    }
    else{
      return SizedBox();
    }

    
       
   
    


  }
}