import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String name;
  final int total;
  final int balance;
  final String date;
  final String status;
  final String transactionId;

  TransactionCard({
    required this.name,
    required this.total,
    required this.balance,
    required this.date,
    required this.status,
    required this.transactionId,
  });

  @override
  Widget build(BuildContext context) {
   
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      transactionId,
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
           // const SizedBox(height: 10),
             Chip(
              label: Text(
                      status,
                style: const TextStyle(color: Colors.green),
              ),
              backgroundColor: const Color.fromARGB(255, 199, 241, 201),
            ),
           // const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total:', style: TextStyle(color: Colors.grey.shade600)),
                    Text(
                      '₹$total',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Balance:', style: TextStyle(color: Colors.grey.shade600)),
                    Text(
                      '₹$balance',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.print, color: Colors.grey.shade600),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.share_outlined, color: Colors.grey.shade600),
                      onPressed: () {},
                    ),
                     IconButton(
                      icon: Icon(Icons.more_vert, color: Colors.grey.shade600),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );



  /*  Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: const Icon(Icons.storefront),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total: ₹$total'),
            Text('Balance: ₹$balance'),
            Text('Date: $date'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: const Icon(Icons.print), onPressed: () {}),
            IconButton(icon: const Icon(Icons.share), onPressed: () {}),
          ],
        ),
      ),
    );  **/
  }
}
