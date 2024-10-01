import 'package:flutter/material.dart';
import 'package:inditab_assignment/view/screens/home_page.dart';
import 'package:inditab_assignment/viewModel/view_model_list.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListViewModel(),
      child: MaterialApp(
            title: 'Inditab Assignment',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            home:  const HomePage(),
          ),
    );
  }
}

