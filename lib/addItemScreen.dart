import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xianinfotech_llp/Services/firestoreServicesController.dart';
import 'package:xianinfotech_llp/itemToSale.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:xianinfotech_llp/main.dart';


class SaleScreen extends StatelessWidget {
  const SaleScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final FirebaseServices firebaseServices = Get.put(FirebaseServices());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 130.0,
        actions: const [
           Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleButton(label: 'Credit', isSelected: true),
                  ToggleButton(label: 'Cash', isSelected: false),
                ],
              ),
              Icon(Icons.settings)
        ],
        title: const Text('Sale'),
        leading: 
        GestureDetector(
          onTap: (){
            Get.back();
          },
          child: const Icon(Icons.arrow_back)),
        bottom:  PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Column(
            children: [
              Divider(thickness: 1),
              Padding(
                padding: EdgeInsets.only(left: 8.0,right: 8.0),
                child: 
                      Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Column(
                            children: [
                              Text('Invoice No',style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey
                              ),),
                               Text(
                            '23-24-01 16',
                            style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            
                            ),
                          ),
                            ],
                          ),
                         const VerticalDivider(
                      color: Colors.black,  // Line color
                        thickness: 2,        // Line thickness
                        width: 20,           // Space around the divider
                        indent: 10,          // Top spacing
                        endIndent: 10,       // Bottom spacing

                         ),
                        Padding(
                          padding: const EdgeInsets.only(right:58.0),
                          child: Column(
                            children: [
                              
                              const Text('Date',
                              style: TextStyle(fontSize: 16.0,
                              color: Colors.grey),),

                               Text(firebaseServices.formattedDate,style: const TextStyle(
                                fontSize: 16.0)
                               ),
                               
                          
                            ],
                          ),
                        ),

                        ],
                      ),
                
            ),
                const SizedBox(height: 8),

            const Divider(thickness: 1),

                // Firm Name
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: 
                    Row(
                      children: [
                        Text(
                          'Firm Name:',
                          style: TextStyle(fontWeight: FontWeight.w100,
                          color: Colors.grey,
                          fontSize: 16),
                        ),
                        Text(
                          ' xianinfotech LLP',
                          style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 16),
                        ),
                        SizedBox(width: 140.0,),
                        Icon(Icons.arrow_drop_down_sharp,
                      ),
                      
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
  const Divider(thickness: 1),

            ],
          ),
        ),
      ),
      body: Stack(
        children: [
           Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                // Customer Details Form
                 TextField(
                  controller: firebaseServices.nameController,
                  decoration: const InputDecoration(
                    labelText: 'Customer *',
                     labelStyle: TextStyle(
                      color: Colors.grey
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Billing Name (Optional)',
                     labelStyle: TextStyle(
                      color: Colors.grey
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      color: Colors.grey
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // Add Items section
               Stack(
                alignment: Alignment.centerRight,
                 children: [
                  const TextField(
                  enabled: false,
                    decoration: InputDecoration(
                   
                      labelStyle: TextStyle(
                        color: Colors.grey
                      ),
                
                    ),
                  ),
                   Padding(
                      padding: const EdgeInsets.only(left: 75.0),
                      child: InkWell(
                        onTap:(){
                          Get.to(()=>AddItemsToSaleScreen());  
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.add_circle,
                            color: Colors.blue,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Add Items',
                                        style: TextStyle(color: Colors.blue,
                                        fontSize: 20.0),
                                      ),
                                Text(
                                  '(Optional)',
                                        style: TextStyle(color: Colors.grey,
                                        fontSize: 20.0),
                                      ),
                                
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                
                 ]
               ),
              
                const SizedBox(height: 16),

                // Total Amount Section
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Amount',
                      style: TextStyle(fontSize: 18),
                    ),
                Text(firebaseServices.totalController.text)
                   ],
                ),
                const Divider(thickness: 2),
              ],
            ),
          ),
          // Bottom button and notification
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Notification at bottom
                Container(
                  color: Colors.red[100],
                  padding: const EdgeInsets.all(8),
                  child: const Row(
                    children: [
                    //  Icon(Icons.info, color: Colors.red),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Your current plan may not support some features.",
                          style: TextStyle(color: Color.fromARGB(255, 61, 61, 61)),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                    ],
                  ),
                ),
                // Save buttons at bottom
                Padding(
               padding: const EdgeInsets.only(bottom: 25.0,left: 8.0),
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
              padding: const EdgeInsets.symmetric(vertical: 16),
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
              backgroundColor: Colors.blue,
              shape: const RoundedRectangleBorder(
                 borderRadius: BorderRadius.zero
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {
             firebaseServices.addSale();
             firebaseServices.nameController.clear();
             firebaseServices.totalController.clear();
             Get.to(()=>const DashboardScreen());
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
        // Share icon button
        IconButton(
          onPressed: () {
            // Handle share button press
          },
          icon: const Icon(
            Icons.share_outlined,
            size: 24,
            color: Colors.blue,
          ),
        ),
      ],
    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black  // Line color
      ..strokeWidth = 2       // Thickness of the line
      ..style = PaintingStyle.stroke;

    var max = size.width;
    var dashWidth = 5;
    var dashSpace = 3;
    double startX = 0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ToggleButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const ToggleButton({
    Key? key,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle toggle button press
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
