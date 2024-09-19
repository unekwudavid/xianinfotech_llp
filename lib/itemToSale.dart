import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xianinfotech_llp/Services/firestoreServicesController.dart';
import 'package:xianinfotech_llp/addItemScreen.dart';

class AddItemsToSaleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseServices firebaseServices = Get.put(FirebaseServices());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text('Add Items to Sale'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Item Name',
                  hintText: 'e.g. Chocolate Cake',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Unit',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      items: ['Unit 1', 'Unit 2'].map((String unit) {
                        return DropdownMenuItem<String>(
                          value: unit,
                          child: Text(unit),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: firebaseServices.totalController,
                      decoration: InputDecoration(
                        labelText: 'Rate (Price/Unit)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Without Tax',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      items: ['With Tax', 'Without Tax'].map((String tax) {
                        return DropdownMenuItem<String>(
                          value: tax,
                          child: Text(tax),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
                Padding(
               padding: const EdgeInsets.only(bottom: 25.0),
                  child: Row(
      children: [
        // Save & New button
         Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero
              ),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            ),
            onPressed: () {
              // Handle Save button press
            },
            child: const Text(
              'Save & New',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black
              ),
            ),
          ),
        ),
        // Save button
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                 borderRadius: BorderRadius.zero
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {
              Get.to(()=>const SaleScreen());
             // firebaseServices.totalController.clear();
                          },
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
           ],
        ),
      ),
          ]
    )
    
    );
  }
}
