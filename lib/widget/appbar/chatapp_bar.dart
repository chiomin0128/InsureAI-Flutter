import 'package:flutter/material.dart';





class ChatAppBar extends StatelessWidget {
  final VoidCallback onPressed;

  const ChatAppBar({super.key, required this.onPressed});


  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: Row(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.space_dashboard_rounded, size: 32),
            ),
          const SizedBox(width: 6),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Assistant',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '보험에 대해 상담해드려요!',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.search, size: 32),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {
              // 버튼 클릭 시 수행할 작업
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white, // 버튼 텍스트 및 아이콘 색상
              side: const BorderSide(width: 1, color: Colors.black), // 테두리 설정
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4), // 버튼 모서리 둥글게
              ),
              padding: const EdgeInsets.only(
                  top: 3, left: 8, right: 4, bottom: 3), // 내부 패딩 조정
              minimumSize: const Size(74, 22), // 최소 크기 설정
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '보험 등록',
                  style: TextStyle(
                    fontSize: 15, // 텍스트 크기 조정
                    fontWeight: FontWeight.w400,
                    height: 1.2, // 'height: 0.11'은 텍스트 높이에 비현실적으로 작으므로 조정
                  ),
                ),
                SizedBox(width: 2), // 텍스트와 아이콘 사이의 간격
                Icon(
                  Icons.navigate_next, // 예시 아이콘, 실제 사용할 아이콘으로 교체 필요
                  size: 12, // 아이콘 크기 조정
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
