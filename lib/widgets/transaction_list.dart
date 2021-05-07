

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 380,
      child: transactions.isEmpty ? Column(children: [
        SizedBox(
          height: 40,
        ),
        Container(
          height: 200,
          child: Image.asset('assets/image/waiting.png', fit: BoxFit.cover,),
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          'No transactions added yet!',
          style: Theme.of(context).textTheme.headline6,
        ),
        
      ],) : ListView.builder(
        itemBuilder: (ctx, index){
          return Card(
            elevation: 5,
              margin: EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 5,
              ),
              child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(child: Text('₹${transactions[index].amount}')),
                ),
              ),
              title: Text(
                transactions[index].title,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transactions[index].date),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}