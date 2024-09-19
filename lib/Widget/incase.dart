/**
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xianinfotech_llp/addItemScreen.dart';
import 'package:xianinfotech_llp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{

 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 229, 247),
      appBar: AppBar(
        bottom: PreferredSize(preferredSize: const Size.fromHeight(80.0),
         child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent.shade100, // Adjusted color shade
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Transaction Details',style: TextStyle(color: Colors.red),),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Party Details'),
                  ),
                ),
              ],
            ),
          ),
         
         ),
        title: const Row(
          children: [
              SizedBox(width: 10.0,),
            Icon(Icons.store_mall_directory_sharp,color: Colors.blue,),
            SizedBox(width: 15.0),
            Text(
              'xianinfotech LLP',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0.5,
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none, ), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings, color: Colors.green), onPressed: () {}),
        ],
      ),
      body: 
      Stack(
        children: [
         Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       filled: true,
            //       fillColor: Colors.white,
            //       hintText: 'Search for a transaction',
            //       prefixIcon: Icon(Icons.search),
            //       suffixIcon: Icon(Icons.filter_alt_outlined),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(8),
            //         borderSide: BorderSide(color: Colors.grey),
            //       ),
            //       contentPadding: EdgeInsets.symmetric(vertical: 0),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                 _buildQuickLinksCard(),
            const SizedBox(height: 10.0),
               TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search for a transaction',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.filter_alt_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
                  _buildTransactionCard('blue sky tech legal solutions', '07 Sep, 24', 24000, 24000, '#23-24-0115'),
                  _buildTransactionCard('Mca Saleel', '28 Aug, 24', 36700, 36700, '#23-24-0114'),
                  _buildTransactionCard('gulf corp logistics company', '14 Aug, 24', 14500, 14500, '#23-24-0113'),

                                  ],
              ),
            ),
          ],
        ),
    Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child:
         GestureDetector(
          onTap: (){
            Get.to(()=>const SaleScreen());
          },
           child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.red, // Background color of the button
                borderRadius: BorderRadius.circular(30), // Rounded edges
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon with the shape of a currency
                  Icon(
                    Icons.currency_rupee, // Or use any other icon
                    color: Colors.white,
                    size: 24,
                  ),
                  SizedBox(width: 8), // Space between icon and text
                  // Text inside the button
                  Text(
                    'Add New Sale',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
         ),
      ),
    ),
   
      ]),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(16.0), // Change the radius as needed
      //   ),
      //   onPressed: () {
      //     // Add sale functionality
      //   },
      //   backgroundColor: Colors.redAccent,
      //   elevation: 6,
      //   child: Icon(Icons.add),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'DASHBOARD'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'ITEMS'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'MENU'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'GET PREMIUM'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
      ),
    );
  }


/** Text(
                          'Add Items (Optional)',
                          style: TextStyle(color: Colors.blue),
                        ), */

 Widget _buildQuickLinksCard() {
  return  Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child:
         Column(
           children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text('Quick Links',style: TextStyle(
                fontSize: 20.0
              ),
              textAlign: TextAlign.start),
            ),
            const SizedBox(height: 30.0,),
             Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildQuickLinkItem(
                  icon: Icons.bookmark,
                  label: 'Add Txn',
                  backgroundColor: Colors.redAccent.shade100,
                  iconColor: Colors.white,
                ),
                _buildQuickLinkItem(
                  icon: Icons.analytics,
                  label: 'Sale Report',
                  backgroundColor: Colors.blueAccent,
                  iconColor: Colors.white,
                ),
                _buildQuickLinkItem(
                  icon: Icons.settings,
                  label: 'Txn Settings',
                  backgroundColor: Colors.blue,
                  iconColor: Colors.white,
                ),
                _buildQuickLinkItem(
                  icon: Icons.view_module,
                  label: 'Show All',
                  backgroundColor: Colors.grey.shade300,
                  iconColor: Colors.black,
                ),
              ],
                     ),
           ],
         ),
      ),
    );
}

Widget _buildQuickLinkItem({
  required IconData icon,
  required String label,
  required Color backgroundColor,
  required Color iconColor,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      CircleAvatar(
        backgroundColor: backgroundColor,
        radius: 20,
        child: Icon(icon, color: iconColor, size: 25),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: const TextStyle(fontSize: 12, color: Colors.black),
      ),
    ],
  );
}


  Widget _buildTransactionCard(String title, String date, double total, double balance, String txnNumber) {
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
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      txnNumber,
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
            const SizedBox(height: 10),
            const Chip(
              label: Text(
                'SALE',
                style: TextStyle(color: Colors.green),
              ),
              backgroundColor: Color.fromARGB(255, 199, 241, 201),
            ),
            const SizedBox(height: 10),
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
  }

  }
**/