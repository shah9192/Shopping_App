import 'package:flutter/material.dart';
import 'Home.dart';
void main(){

    runApp(
        const MaterialApp(
          title:'Routing App',
          home: Home(),
          debugShowCheckedModeBanner: false,
        )
    );
}