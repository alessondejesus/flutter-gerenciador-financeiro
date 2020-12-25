import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:gerenciador_financeiro/models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List <Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index){
          final element = transactions[index];

          return Card(
            child: Row(
              children: [
                Container(
                  margin:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColor
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: (Text(
                    'R\$ ${element.value.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor
                    ),
                  )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      element.title,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('d MMM y').format(element.date),
                      style: TextStyle(
                          color: Colors.grey[700]
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
