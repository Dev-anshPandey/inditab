import 'package:flutter/material.dart';
import 'package:inditab_assignment/view/widget/drop_down.dart';
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
      return Column(
        children: [
            Container(height: 0.1,  width: MediaQuery.of(context).size.width,color: Colors.black,),
          ListTile(
                          title: Text(listViewModel.fetchedList[index].title.toString(),style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.026,fontWeight: FontWeight.bold ),),
                          subtitle: Text(listViewModel.fetchedList[index].description.toString(),style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.02,fontWeight: FontWeight.normal)),
                          trailing: Text(DateFormat.yMd().format(listViewModel.fetchedList[index].date??DateTime.now()),style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.02,fontWeight: FontWeight.normal)),
                        ),
                         Container(height: 0.1,  width: MediaQuery.of(context).size.width,color: Colors.black,)
        ],
      );
    }
    else if((listViewModel.filter.contains(listViewModel.fetchedList[index].date?.day.toString()) || listViewModel.filterDates==0 ) && (listViewModel.filter.contains(DateFormat.LLLL().format(listViewModel.fetchedList[index].date??DateTime.now())) || listViewModel.filterMonths==0 )   &&( listViewModel.filter.contains(DateFormat.E().format(listViewModel.fetchedList[index].date??DateTime.now()))  || listViewModel.filterWeeks==0 )){
      return Column(
        children: [
            Container(height: 0.1,  width: MediaQuery.of(context).size.width,color: Colors.black,),
          ListTile(
                          title: Text(listViewModel.fetchedList[index].title.toString(),style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.026,fontWeight: FontWeight.bold ),),
                          subtitle: Text(listViewModel.fetchedList[index].description.toString(),style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.02,fontWeight: FontWeight.normal)),
                          trailing: Text(DateFormat.yMd().format(listViewModel.fetchedList[index].date??DateTime.now()),style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.02,fontWeight: FontWeight.normal)),
                        ),
                         Container(height: 0.1,  width: MediaQuery.of(context).size.width,color: Colors.black,)
        ],
      );
    }
    else{
      return SizedBox();
    }

    
       
   
    


  }
}