import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inditab_assignment/model/list_model.dart';
import 'package:inditab_assignment/viewModel/view_model_list.dart';
import 'package:provider/provider.dart';

Future apigetList(BuildContext context) async{
    Dio dio = Dio();
    const url = "https://ixifly.in/flutter/task1";
    Response response = await dio.request(
      url,
      options: Options(
        method: 'GET',
      ),
    );
     Map tempMap = jsonDecode(response.data);
     print(tempMap);
     final listViewModel=Provider.of<ListViewModel>(context, listen: false);
    //  listViewModel.clearList();
     for(var x in tempMap['data']){
      listViewModel.addToList(ListModel(
        title: x['title'],
        date: DateFormat("yyyy-mm-dd").parse(x['date']),
        description: x['description']
      ));
        
     }

}

