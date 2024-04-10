import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/chat_models.dart'; // ChatMessage 모델을 import
import 'package:intl/intl.dart';

class StateLayer extends StatelessWidget {
  final ChatMessage message; // ChatMessage 객체를 직접 받습니다.
  const StateLayer({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // 메시지 시간을 포맷팅합니다.
    String formattedTime =
        DateFormat('a hh:mm', 'ko').format(message.timestamp);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min, // 자식 위젯들이 필요한 만큼의 공간만 차지하도록 설정
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: message.isFromServer
            ? MainAxisAlignment.start
            : MainAxisAlignment.end, // Adjust alignment based on the message source
        children: [
          Visibility(
            visible: !message.isFromServer , // 서버에서 온 메시지일 때만 시간을 표시합니다.
            child: Text(
              formattedTime, // 메시지 시간 표시
              style: TextStyle(
                fontSize: 8,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          const SizedBox(width: 8), // 시간과 메시지 박스 사이의 여백
          Flexible(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: const Color(0xffeeeeee), // 배경색 설정
                borderRadius: BorderRadius.circular(18), // 둥근 모서리 설정
              ),
              child: Text(
                message.message, // 메시지 내용 표시
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
