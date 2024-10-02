import 'package:flutter/material.dart';
import 'package:inditab_assignment/viewModel/view_model_list.dart';
import 'package:provider/provider.dart';

class BottomSheetWidget extends StatelessWidget {
  var items;
  var date;
  var week;
  var month;
  BottomSheetWidget({super.key,required this.items , required this.date , required this.month , required this.week});

  @override
  Widget build(BuildContext context) {
      final listViewModel=Provider.of<ListViewModel>(context, listen: false);
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
                                                    return FilterOption(listViewModel: listViewModel, items: items, date: date, month: month, week: week, index: index,);
                                                   }
                                                   ,itemCount: items=='Date' ? date.length :items=='Month' ? month.length : week.length,
                                                   scrollDirection: Axis.horizontal,
                                                   ),
                                                 )
                                                ],
                                              )

                                            );
  }
}

class FilterOption extends StatefulWidget {
   FilterOption({
    super.key,
    required this.listViewModel,
    required this.items,
    required this.date,
    required this.month,
    required this.week,
    required this.index
  });

  final ListViewModel listViewModel;
  final dynamic items;
  final dynamic date;
  final dynamic month;
  final dynamic week;
  int index;

  @override
  State<FilterOption> createState() => _FilterOptionState();
}

class _FilterOptionState extends State<FilterOption> {
  bool isSelected=false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { 
        setState(() {
                  isSelected=!isSelected;
        });
         widget.listViewModel.sortFetchedList();
     if(widget.items=='Date')     widget.listViewModel.filter.contains(widget.date[widget.index])==true ? widget.listViewModel.filterRemove(widget.date[widget.index]): widget.listViewModel.filterAdd(widget.date[widget.index]);
      if(widget.items=='Month')     widget.listViewModel.filter.contains(widget.month[widget.index])==true ? widget.listViewModel.filterRemove(widget.month[widget.index]): widget.listViewModel.filterAdd(widget.month[widget.index]);
      if(widget.items=='Week')  widget.listViewModel.filter.contains(widget.week[widget.index])==true ? widget.listViewModel.filterRemove(widget.week[widget.index]): widget.listViewModel.filterAdd(widget.week[widget.index]);
      },
      child: Container(
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black , width: 1),
          color: isSelected  ?  Colors.grey : widget.items=='Date'? widget.listViewModel.filter.contains(widget.date[widget.index])==true? Colors.grey: Colors.white : widget.items=='Month'? widget.listViewModel.filter.contains(widget.month[widget.index])==true? Colors.grey: Colors.white : widget.items=='Week'? widget.listViewModel.filter.contains(widget.week[widget.index])==true? Colors.grey: Colors.white : Colors.white
        ),
        child: Text(widget.items=='Date' ?widget.date[widget.index]:widget.items=='Month' ? widget.month[widget.index]:widget.week[widget.index])),
    );
  }
}