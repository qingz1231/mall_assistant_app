import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: const Center(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for shops or restaurants',
                        prefixIcon: Icon(Icons.search),
                        //suffixIcon: Icon(Icons.camera_alt)),
                      ),
                    ),
                  ),
                ),
              ),
            );
  }
}