import 'package:flutter/material.dart';
import 'package:inditab_assignment/view/widget/bottom_sheet.dart';
import 'package:inditab_assignment/viewModel/view_model_list.dart';
import 'package:provider/provider.dart';
var items = [    
    'Date',
    'Week',
    'Month',
  ];
  List date =['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30'];
  List week=['Sun','Mon','Tue','Wed','Thu','Fri','Sat','Sun'];
  List month=['January','February','March','April','May','June','July','August','September','October','November','December'];
  String dropdownvalue = 'Date'; 
class FilterDropDown extends StatefulWidget {
  const FilterDropDown({super.key});

  @override
  State<FilterDropDown> createState() => _FilterDropDownState();
}

class _FilterDropDownState extends State<FilterDropDown> {
  @override
  Widget build(BuildContext context) {
    final listViewModel=Provider.of<ListViewModel>(context, listen: false);
    return DropdownButton(
                        
                        hint: Text('Filter'),
                                    
                                    // Initial Value
                                    value: dropdownvalue,
                                    
                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),    
                                    
                                    // Array list of items
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        onTap: () { 
                                          //  listViewModel.sortFetchedList();
                                          showBottomSheet(context: context, builder: (BuildContext context){
                                            return BottomSheetWidget(items: items,date: date,week: week,month: month,);
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
                                  );
  }
}