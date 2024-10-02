import 'package:flutter/material.dart';
import 'package:inditab_assignment/model/list_repository.dart';
import 'package:inditab_assignment/view/widget/drop_down.dart';
import 'package:inditab_assignment/view/widget/list_widget.dart';
import 'package:inditab_assignment/viewModel/view_model_list.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
      ListViewModel lvm=ListViewModel();
       lvm.fetchList(context);
            
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer<ListViewModel>(
       builder: (context, value, child) {
        final listViewModel=Provider.of<ListViewModel>(context, listen: false);
         return Padding(
          padding:  EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.04 , left: MediaQuery.of(context).size.width*0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        listViewModel.sortFetchedList();
                      },
                      child: Text("Inditab",style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.032,fontWeight: FontWeight.normal))),
                    Padding(
                      padding:  EdgeInsets.only(right:MediaQuery.of(context).size.width*0.04 ),
                      child: FilterDropDown()
                    ),
                  ],
                ),
              ),
              
          
                        Expanded(
                child:  RefreshIndicator(
                  onRefresh: () async{
                    
                     listViewModel.clearList();
                     listViewModel.fetchList(context);
                  },
                  child:  ListView.builder(
                    itemBuilder: (context,index){
                    
                    return ListWidget(listViewModel: listViewModel, index: index );
                    
                  },
                  itemCount: listViewModel.fetchedList.length,
                  ),
                ),
              
              ),
            ],
          ));
       },
        ),
      );
    
  }
}
