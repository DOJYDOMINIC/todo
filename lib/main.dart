import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo/view/homepage.dart';

import 'control/providerone.dart';

void main ()async{
  await Hive.initFlutter();
  await Hive.openBox('my_box');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderOne(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer(
            builder: (context, value, child) => Homepage()),
      ),
    );
  }
}
