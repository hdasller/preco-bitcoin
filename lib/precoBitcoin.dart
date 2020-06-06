import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart'as http;
class PrecoBitcoin extends StatefulWidget {
  @override
  _PrecoBitcoinState createState() => _PrecoBitcoinState();
}

class _PrecoBitcoinState extends State<PrecoBitcoin> {
  double _precoBitcoin = 0.00;
  void _getPrecoBitcoin() async{
    Map<String, dynamic> tickers;
    http.Response response = await http.get("https://blockchain.info/ticker");
    tickers = json.decode(response.body);
    print(tickers);
    setState(() {
      _precoBitcoin =  tickers["BRL"]["buy"];
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Image.asset("imagens/bitcoin.png"),
          ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("R\$ ${_precoBitcoin.toString()}", style: TextStyle(fontSize: 30),),
            ),
            RaisedButton(
              color: Colors.amber,
              onPressed: _getPrecoBitcoin,
              child: Text("Obter valor",
              style:  TextStyle(
                color: Colors.white,
              ),),
            ),

          ],
        ),
      ),
    );
  }
}
