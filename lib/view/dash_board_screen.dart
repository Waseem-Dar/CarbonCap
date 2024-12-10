import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
 import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_mvvm_riverpod_task/main.dart';
import 'package:flutter_mvvm_riverpod_task/utils/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// State Provider for dynamic values (optional)
final accountSummaryProvider = Provider((ref) => {
  "availableCredits": "20,800 (tons of co2)",
  "soldCredits": "20,800 (tons of co2)",
  "earnedCredits": "28,000 (tons of co2)",
  "treeCount": "10,000 Trees",
});

class DashBoardScreen extends ConsumerWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountSummary = ref.watch(accountSummaryProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.png'), // Replace with user profile image
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Zohaib Hassar",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.verified, color: Colors.green, size: 16),
                    Text(" Verified", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Menu action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Summary Section
            const Text(
              "Account Summary",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryCard(
                  "Carbon Credits Available",
                  accountSummary["availableCredits"]!,
                  Colors.blueAccent,
                ),
                _buildSummaryCard(
                  "Carbon Credits Sold",
                  accountSummary["soldCredits"]!,
                  Colors.teal,
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildSummaryCard(
              "Carbon Credits Earned",
              accountSummary["earnedCredits"]!,
              Colors.green,
              isFullWidth: true,
            ),
            const SizedBox(height: 20),

            // My Tree Pool Section
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green[100],
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text("My Tree Pool"),
                      Text(
                        accountSummary["treeCount"]!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add Tree action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text("Add Green Project"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Recent Projects Carousel
            const Text(
              "Recent Green Projects",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CarouselSlider(
              items: [
                _buildProjectCard(
                  "Triplefold innovation: economic empowerment, reducing GHG emissions, and raising awareness.",
                  "assets/project1.png", // Replace with your asset
                ),
                _buildProjectCard(
                  "Planting trees to offset carbon footprint and enhance biodiversity.",
                  "assets/project2.png", // Replace with your asset
                ),
              ],
              options: CarouselOptions(
                height: 150,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Projects"),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
          BottomNavigationBarItem(icon: Icon(Icons.change_circle_outlined), label: "Target"),
        ],
        onTap: (index) {
         if(index== 1){
           context.goNamed(AppRoutesConstant.projectsRouteName);
         }else  if(index == 2){
           context.goNamed(AppRoutesConstant.walletRouteName);
         }else if(index == 3){
           context.goNamed(AppRoutesConstant.targetRouteName);
         }else{
           context.goNamed(AppRoutesConstant.homeRouteName

           );
         }
        },
      ),
    );
  }

  // Helper widget to build summary card
  Widget _buildSummaryCard(String title, String value, Color color, {bool isFullWidth = false}) {
    return Expanded(
      flex: isFullWidth ? 2 : 1,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build project card
  Widget _buildProjectCard(String description, String assetPath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Text(
        description,
        style: const TextStyle(
          color: Colors.white,
          backgroundColor: Colors.black54,
          fontSize: 14,
        ),
      ),
    );
  }
}
