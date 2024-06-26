  // ignore_for_file: use_key_in_widget_constructors

  import 'package:flutter/material.dart';
  import 'package:intl/intl.dart';
  import '../models/transaction.dart';

  class TransactionsList extends StatelessWidget {
    final List<transaction> transactions;
    final Function deletetx;
    TransactionsList(
      this.transactions,
      this.deletetx,
    );
    @override
    Widget build(BuildContext context) {
      return Container(
        height: 650,
        child: transactions.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "No transactions added yet!",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      "assets/image/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FittedBox(
                              child: Text("\$${transactions[index].amount}")),
                        ),
                      ),
                      title: Text(transactions[index].title),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () {
                          deletetx(transactions[index].id);
                        },
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ),
      );
    }
  }
