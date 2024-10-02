import 'package:flutter/cupertino.dart';
import 'package:inditab_assignment/model/list_model.dart';
import 'package:inditab_assignment/model/list_repository.dart';
import 'package:inditab_assignment/view/widget/drop_down.dart';

class ListViewModel extends ChangeNotifier{
   List<ListModel> fetchedList=[];
   int filterDates=0;
   int filterWeeks=0;
   int filterMonths=0;
   List<dynamic> filter=[];

    fetchList(BuildContext context){
    apigetList(context);
   }

   void sortFetchedList(){
    fetchedList.sort((a,b)=>a.date!.compareTo(b.date??DateTime.now()));
    notifyListeners();
   }

   void filterAdd(dynamic p){
    filter.add(p);
    date.contains(p) ? filterDates++ :week.contains(p) ? filterWeeks++ : filterMonths++;
    notifyListeners();
   }

   void filterRemove(dynamic p){
    filter.remove(p);
    date.contains(p) ? filterDates-- :week.contains(p) ? filterWeeks-- : filterMonths--;
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