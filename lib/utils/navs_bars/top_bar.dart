import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return SliverAppBar(
      backgroundColor: bg_primary,
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
                backgroundColor: bg_primary,
  automaticallyImplyLeading: false,
  title: Container(
    width: double.infinity,
    height: 40,
    color: bg_secondary,
    child: Center(
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          
          hintText: 'Search for shops or restaurants',
          hintStyle: TextStyle(color: txt3),
          prefixIcon: GestureDetector(
            onTap: () {
              
            },
            child: const Icon(Icons.search,color: txt3,), // Remove 'const' from GestureDetector
          ),
        ),
        
      ),
    ),
  ),
),

            );
  }
}