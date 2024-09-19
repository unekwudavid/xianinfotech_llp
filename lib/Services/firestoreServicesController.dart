import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

  
class FirebaseServices extends GetxController{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();
  

    // Get the current date and format it
  final String  formattedDate = DateFormat('dd MMM, yy').format(DateTime.now());


  //Write
    Future<void> addSale() async {
    CollectionReference sales = FirebaseFirestore.instance.collection('sales');

    await sales.add({
      'name': nameController.text,         // Name of the transaction
      'total': int.parse(totalController.text),  // Total amount
      'balance': int.parse(totalController.text),  // Balance amount
      'date': formattedDate,   // Date of transaction
      'status': 'sale',                    // Status of the transaction
      'transactionId': '#23-24-0116',       // Transaction ID
    }).then((value) => print("Sale Added"))
      .catchError((error) => print("Failed to add sale: $error"));
  }

 
  //Read for database
  Future<List<Map<String, dynamic>>> fetchSalesData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('sales').orderBy('date',descending: true).get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

}