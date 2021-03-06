import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciador_financeiro/components/chart.dart';
import 'components/transaction_form.dart';
import 'models/transaction.dart';
import 'components/transaction_list.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme:
      ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Quicksand'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _addTransaction(String title, double value, DateTime date) {
    final transaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date);

    setState(() {
      _transactions.add(transaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String index) {
    setState(() {
      _transactions.removeWhere((element) {
        return element.id == index;
      });
    });
  }

  final List<Transaction> _transactions = [
    Transaction(
        id: '1',
        title: 'Água',
        value: 25,
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: '2',
        title: 'Luz',
        value: 36,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: '3',
        title: 'Comida',
        value: 70,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: '4',
        title: 'Remedio',
        value: 20,
        date: DateTime.now().subtract(Duration(days: 5))),
    Transaction(
        id: '5',
        title: 'Supermercado',
        value: 30,
        date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        id: '6',
        title: 'Lanche',
        value: 90,
        date: DateTime.now().subtract(Duration(days: 6))),
    Transaction(
        id: '7',
        title: 'Padaria',
        value: 50,
        date: DateTime.now().subtract(Duration(days: 7))),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    final myAppBar = AppBar(
      title: Text('Despesas Pessoais',
      style: TextStyle(
        fontSize: 20 * MediaQuery.of(context).textScaleFactor
      ),),
      actions: [
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
            padding: EdgeInsets.all(10))
      ],
    );

    final availableHeight = MediaQuery
        .of(context)
        .size.height - myAppBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: myAppBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: availableHeight * 0.3,
                  child: Chart(_recentTransactions),),
                Container(
                  height: availableHeight * 0.7,
                  child: new TransactionList(_transactions, _removeTransaction),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
