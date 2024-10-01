import 'package:flutter/material.dart';
import 'package:inditab_assignment/model/list_repository.dart';
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

var items = [    
    'Date',
    'Week',
    'Month',
  ];
  List date =['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30'];
  List week=['Sun','Mon','Tue','Wed','Thu','Fri','Sat','Sun'];
  List month=['January','Februray','March','April','May','June','July','August','September','October','November','December'];
  String dropdownvalue = 'Date'; 
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
                    Text("Inditab",style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.032,fontWeight: FontWeight.normal)),
                    Text(listViewModel.filter.length.toString()),
                    Padding(
                      padding:  EdgeInsets.only(right:MediaQuery.of(context).size.width*0.04 ),
                      child: DropdownButton(
                        
                        hint: Text('Filter'),
                                    
                                    // Initial Value
                                    value: dropdownvalue,
                                    
                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),    
                                    
                                    // Array list of items
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        onTap: () { 
                                          showBottomSheet(context: context, builder: (BuildContext context){
                                            return SizedBox(
                                              height: MediaQuery.of(context).size.height*0.4,
                                              width: double.infinity,
                                              child: Column(
                                                children: [
                                                  Text('Select $items'),
                                                 Expanded(
                                                   child: GridView.builder(
                                                    
                                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: items=='Date' ?5:items=='Month' ? 3:3),
                                                    itemBuilder: (context,index){
                                                    return InkWell(
                                                      onTap: () { 
                                                     if(items=='Date')     listViewModel.filter.contains(date[index])==true ? listViewModel.filterRemove(date[index]): listViewModel.filterAdd(date[index]);
                                                      if(items=='Month')     listViewModel.filter.contains(month[index])==true ? listViewModel.filterRemove(month[index]): listViewModel.filterAdd(month[index]);
                                                      if(items=='Week')  listViewModel.filter.contains(week[index])==true ? listViewModel.filterRemove(week[index]): listViewModel.filterAdd(week[index]);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(2),
                                                        margin: EdgeInsets.all(8),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: Colors.black , width: 1),
                                                          color: Colors.grey
                                                        ),
                                                        child: Text(items=='Date' ?date[index]:items=='Month' ? month[index]:week[index])),
                                                    );
                                                   }
                                                   ,itemCount: items=='Date' ? date.length :items=='Month' ? month.length : week.length,
                                                   scrollDirection: Axis.horizontal,
                                                   ),
                                                 )
                                                ],
                                              )

                                            );
                                          });
                                        },
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) { 
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                  ),
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child:  RefreshIndicator(
                  onRefresh: () async{
                    ListViewModel lvm =ListViewModel();
                     lvm.clearList();
                    lvm.fetchList(context);
                  },
                  child: ListView.separated(
                     separatorBuilder: (context, index) {
                          return Container(height: 0.1,  width: MediaQuery.of(context).size.width,color: Colors.black,);
                        },
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
