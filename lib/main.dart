import 'package:flutter/material.dart';
import 'package:precobitcoin/precoBitcoin.dart';
void main (){
  runApp(MaterialApp(
    home: PrecoBitcoin(),
    initialRoute: "/",
    routes: {
      "/preco-bitcoin": (context)=>PrecoBitcoin(),
    }
  ));
}