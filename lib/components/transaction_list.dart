import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:gerenciador_financeiro/models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List <Transaction> transactions;
  final void Function(String) removeTransactionFunction;

  TransactionList(this.transactions, this.removeTransactionFunction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty ? Column(
      children: [
        Text('Nenhuma transação encontrada',
        style: Theme.of(context).textTheme.title,
        ),
        SizedBox(height: 20),
        Container(
          height: 300,
          child: Image.asset('assets/images/waiting.png',
            fit: BoxFit.cover,
          ),
        )
      ],
    ) : ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index){
        final element = transactions[index];

        return Card(
          elevation: 2,
          child: ListTile(
            trailing: FlatButton(
              child: Icon(Icons.delete, color: Colors.red[500],),
              onPressed: () => removeTransactionFunction(element.id),
            ),
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: FittedBox(
                    child: Text('R\$${element.value}')
                ),
              ),
            ),
            title: Text(
              element.title,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              DateFormat('d MMM y').format(element.date).toString()
            ),
          ),
        );
      },
    );
  }
}
