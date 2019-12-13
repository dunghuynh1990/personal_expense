import 'package:flutter/material.dart';
import 'package:personal_expense/model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;
  TransactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transaction.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text('\$${transaction[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(transaction[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transaction[index].id),
                    ),
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
