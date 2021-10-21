import 'dart:developer';

import 'package:famiily_app/views/chat/chat_view.dart';
import 'package:famiily_app/views/favourite/favouriteView.dart';
import 'package:famiily_app/views/profile/profile_view.dart';
import 'package:famiily_app/views/timeline/timeline_view.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
 // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance();
  int _currentIndex = 0;
  final List<Widget> _views = [
    const TimelineView(),
    const ChatView(),
    const FavouriteView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _views,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (selectedTab) {
            setState(() {
              _currentIndex = selectedTab;
            });
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'Timeline'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'Favourite'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Profile')
          ]),
    );
  }
}
