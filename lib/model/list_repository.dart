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
    try{
      
    dio.interceptors.add(
InterceptorsWrapper(
    
    onError: (DioException error, ErrorInterceptorHandler handler) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  content: Text('Ops ${error.type} !!'),
));

      return handler.next(error);
    },
  ),
    );
    Response response = await dio.request(
      url,
      options: Options(
        method: 'GET',
      ),
    );
      print("Error code 1is ${response.statusCode}");
    if(response.statusCode==200){
       Map tempMap = jsonDecode(response.data);
     
     final listViewModel=Provider.of<ListViewModel>(context, listen: false);
     for(var x in tempMap['data']){
      listViewModel.addToList(ListModel(
        title: x['title'],
        date: DateFormat("yyyy-mm-dd").parse(x['date']),
        description: x['description']
      ));
        
     }

    }
   
    }
    catch(e){
      
      print("Exception - $e");
      
    }
    
    

}