import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return SliverAppBar(
              floating: true,
              pinned: true,
              snap: false,
              centerTitle: false,
              automaticallyImplyLeading: false,
              title: GestureDetector(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Location",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Tap to Change", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ],
              bottom: AppBar(
  automaticallyImplyLeading: false,
  title: Container(
    width: double.infinity,
    height: 40,
    color: Colors.white,
    child: Center(
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search for shops or restaurants',
          prefixIcon: GestureDetector(
            onTap: () {
              
            },
            child: const Icon(Icons.search), // Remove 'const' from GestureDetector
          ),
        ),
      ),
    ),
  ),
),

            );
  }
}