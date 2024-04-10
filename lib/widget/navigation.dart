import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/mainpage/chat_page.dart';
import 'package:flutter_application_1/screens/mainpage/home_page.dart';
import 'package:flutter_application_1/screens/mainpage/insure_page.dart';
import 'package:flutter_application_1/screens/mainpage/settings_page.dart';
import 'package:flutter_application_1/widget/drawer/chatpage_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  Navigation createState() => Navigation();
}

class Navigation extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  // NavigationBar 아이템과 페이지 타이틀을 쌍으로 매핑합니다.
  final List<Map<String, dynamic>> _navigationItems = [
    {'icon': Icons.home, 'label': '홈',
      'page': const HomePage()
    },
    {'icon': Icons.contacts, 'label': '보험',
      'page': const InsurePage()
    },
    {'icon': Icons.chat, 'label': '채팅',
      'page': const ChatPage(),
      'drawer' : const ChatPageDrawer() 
    },
    {'icon': Icons.build, 'label': '설정',
      'page': const SettingsPage()
    },
    // 추가 페이지는 여기에 매핑 정보를 추가합니다.
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getCurrentPage() {
    return _navigationItems[_selectedIndex]['page'];
  }
  Widget? _getDrawer() {
    if (_navigationItems[_selectedIndex].containsKey('drawer') && _navigationItems[_selectedIndex]['drawer'] != null) {
      return _navigationItems[_selectedIndex]['drawer'];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      key: _scaffoldKey,
      body: GestureDetector(child: _getCurrentPage()),
      drawer: _getDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationItems
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(item['icon']),
                  label: item['label'],
                ))
            .toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF202226),
        unselectedItemColor: const Color(0xFF949BA5),
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}
