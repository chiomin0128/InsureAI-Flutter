import 'package:flutter/material.dart';

class ChatPageDrawer extends StatelessWidget {
  const ChatPageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold 제거 및 직접 Drawer 반환
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0,
      width: 340,
      // Drawer 내부에 들어갈 내용
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 60,
            child: DrawerHeader(
              padding: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '김동완님',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Scaffold.of(context).closeDrawer();
                        },
                        icon: const Icon(Icons.arrow_left),
                        iconSize: 30,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15,left: 15),
            child: Container(
              height: 37,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30), // 모서리를 동글게 하기
              ),
              child: TextField(
                onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                decoration: const InputDecoration(
                  hintText: "검색...",
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search), 
                  contentPadding: EdgeInsets.fromLTRB(15, 0, 5, 0),
                   // 여기를 조정해 보세요
                ),
              ),
            ),
          ),
          InkWell(
            child: Container(
              height: 60,
              padding: const EdgeInsets.only(top: 8, left: 16, bottom: 8),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('4월 2일'),
                  SizedBox(width: 16),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "안녕하세요",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Supporting line text lorem ipsum dolor sit amet, consectetur.",
                          style: TextStyle(
                              fontSize: 12, overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              // print("click");
            },
          ),
          IconButton(
              onPressed: () {
                // print("hello");
              },
              icon: const Icon(Icons.add))
          // 추가적인 리스트 타일들...
        ],
      ),
    );
  }
}
