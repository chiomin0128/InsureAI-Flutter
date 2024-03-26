import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  String _response = '';

  Future<void> sendRequest(String message) async {
    var requestUri = Uri.parse('http://127.0.0.1:8000/chat/stream'); // 서버의 URL 수정
    var httpClient = HttpClient();

    try {
      // HTTP 요청을 준비합니다.
      var request = await httpClient.postUrl(requestUri);
      request.headers.set(HttpHeaders.contentTypeHeader, "application/json");

      // JSON 본문을 추가합니다.
      request.add(utf8.encode(json.encode({
        'query': message,
        'user_no': 324,
      })));

      // 요청을 보내고 응답을 받습니다.
      var response = await request.close();

      // 응답 스트림을 처리합니다.
      await for (var contents in response.transform(Utf8Decoder())) {
        setState(() {
          _response += contents; // 응답을 누적합니다.
        });
      }
    } catch (e) {
      print("Error sending request: $e");
    } finally {
      httpClient.close();
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('AI Chat Service'),
    ),
    body: Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Text(_response, style: const TextStyle(fontSize: 24)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              width: 313,
              height: 56, // 높이를 조금 더 늘려서 TextField 내부의 텍스트가 잘 보이도록 합니다.
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: ShapeDecoration(
                
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(25),
                  
                ),
              ),
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: '궁금한 내용을 물어보세요!',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none, // 외곽선을 없애고 컨테이너의 스타일을 사용합니다.
                  ),
                  filled: true,
                  fillColor: Colors.transparent, // 배경색을 투명하게 설정합니다.
                ),
                onSubmitted: (String value) async {
                  await sendRequest(value);
                  _controller.clear();
                },
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}