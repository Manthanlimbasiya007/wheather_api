import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather_api/screen/provider/home_provider.dart';
import 'package:wheather_api/screen/view/home_screen.dart';

void main()
{
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
      )
    ],
    child: MaterialApp(
       debugShowCheckedModeBanner: false,
      routes: {
         '/':(context) => homescreen(),
      },
    ),
  ));
}