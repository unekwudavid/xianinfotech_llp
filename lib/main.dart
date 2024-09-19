import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xianinfotech_llp/Services/firestoreServicesController.dart';
import 'package:xianinfotech_llp/Widget/transactionCard.dart';
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
    return const GetMaterialApp(
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

final FirebaseServices firebaseServices = Get.put(FirebaseServices());



class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});


  
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

    FocusNode _focusNode = FocusNode();
  bool _showCursor = false;

  @override
  void initState() {
    super.initState();

    // Add a listener to the focus node to toggle cursor visibility on tap
    _focusNode.addListener(() {
      setState(() {
        _showCursor = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 16,right: 16),
             child: _buildQuickLinksCard(),
              ),
            ],
          ),
                Padding(
                 padding: const EdgeInsets.only(top: 165.0,left: 16,right: 16,bottom: 20.0),
                 child: TextField(
                  focusNode: _focusNode,
                   showCursor: _showCursor,          // Initially false, shows on tap
                    cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search for a transaction',
                    hintStyle: TextStyle(),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.filter_alt_outlined),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                  ),
                               ),
               ),
              Padding(
                padding: const EdgeInsets.only(top: 220.0,left: 16.0,right: 16.0),
                child: FutureBuilder<List<Map<String, dynamic>>>(
                         future: firebaseServices.fetchSalesData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }
                
                          if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          }
                
                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Center(child: Text('No transactions available'));
                          }
                
                          final salesData = snapshot.data!;
                          return ListView.builder(
                            itemCount: salesData.length,
                            itemBuilder: (context, index) {
                final sale = salesData[index];
                return TransactionCard(
                  name: sale['name'],
                  total: sale['total'],
                  balance: sale['balance'],
                  date: sale['date'],
                  status: sale['status'],
                  transactionId: sale['transactionId'],
                );
                            },
                          );
                        },
                      ),
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
}