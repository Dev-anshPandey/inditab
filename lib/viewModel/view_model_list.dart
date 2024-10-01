import 'package:flutter/cupertino.dart';
import 'package:inditab_assignment/model/list_model.dart';
import 'package:inditab_assignment/model/list_repository.dart';

class ListViewModel extends ChangeNotifier{
   List<ListModel> fetchedList=[];
   List filterDates=[];
   List filterWeeks=[];
   List filterMonths=[];
   List<dynamic> filter=[];

   void fetchList(BuildContext context){
    apigetList(context);
   }

   void filterAdd(dynamic p){
    filter.add(p);
    notifyListeners();
   }

   void filterRemove(dynamic p){
    filter.remove(p);
    notifyListeners();
   }
   
   void clearList(){
    fetchedList.clear();
    notifyListeners();
   }

   void addToList(ListModel listElement){
        fetchedList.add(listElement);
        notifyListeners();
   }

   List<ListModel> getList(){
    return fetchedList;
   }
}