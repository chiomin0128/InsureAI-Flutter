import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/chat_models.dart';
import 'package:flutter_application_1/service/chat_service/chat_service.dart';
import 'package:flutter_application_1/service/chat_service/chat_service_api.dart';
import 'package:flutter_application_1/widget/appbar/chatapp_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final ChatServiceAPI chatService = ChatServiceAPI();
  final TextEditingController _controller = TextEditingController();
  StreamController<String> streamController = StreamController<String>();
  List<ChatMessage> messages = []; // ChatMessage 객체를 저장할 리스트

  void _addMessage(String messageText, {bool isFromServer = false})  {
    if (messageText.isNotEmpty) {
      final message = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch,
        chatRoomId: 1,
        message: messageText,
        timestamp: DateTime.now(),
        isFromServer: isFromServer, // Pass the new parameter here
      );
      setState(() {
        messages.add(message);
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: PreferredSize(
            preferredSize: const Size.fromHeight(51), // 여기서 AppBar의 높이를 설정
            child: ChatAppBar(onPressed: () {
              Scaffold.of(context).openDrawer();
            }), // 사용자 정의 AppBar 위젯
          ),
        ),
        drawer: const Drawer(),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return StateLayer(message: messages[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Container(
                  width: 313,
                  height: 40, // 높이를 조금 더 늘려서 TextField 내부의 텍스트가 잘 보이도록 합니다.
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                    autocorrect: false,
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: InputDecoration(
                      hintText: '궁금한 내용을 물어보세요!',
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            BorderSide.none, // 외곽선을 없애고 컨테이너의 스타일을 사용합니다.
                      ),
                      suffixIcon: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.arrow_forward_sharp),
                        onPressed: () {
                          _addMessage(_controller.text);
                        },
                      ),
                      filled: true,
                      fillColor: Colors.transparent, // 배경색을 투명하게 설정합니다.
                    ),
                    onSubmitted: (String value) async {
                      _addMessage(value);}
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
