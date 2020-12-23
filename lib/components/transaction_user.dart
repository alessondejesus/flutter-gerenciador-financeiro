import 'dart:math';
import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final _transactions = [
    Transaction(id: '1', title: 'Água', value: 25, date: DateTime.now()),
    Transaction(id: '2', title: 'Luz', value: 36, date: DateTime.now()),
    Transaction(id: '3', title: 'Internet', value: 50, date: DateTime.now()),
  ];

  _addTransaction(String title, double value){
    final transaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now()
    );

    print(title);
    print(value);

    setState(() {
      _transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 50,
            child: Card(
              color:  Colors.deepPurple,
              elevation: 10,
              child: (Text('Grafico')),
            ),
          ),

          new TransactionForm(_addTransaction),
          new TransactionList(_transactions),
        ],
      ),
    );
  }
}
