// chat_models.dart

class ChatRoom {
  final int id;
  final String name; // 채팅방 이름

  ChatRoom({required this.id, required this.name});

  // 데이터베이스에 저장하기 위한 맵 변환 함수
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // 맵에서 객체로 변환하는 팩토리 생성자
  factory ChatRoom.fromMap(Map<String, dynamic> map) {
    return ChatRoom(
      id: map['id'],
      name: map['name'],
    );
  }
}

class ChatMessage {
  final int id;
  final int chatRoomId; // 이 메시지가 속한 채팅방 ID
  final String message; // 메시지 내용
  final DateTime timestamp; // 메시지 시간
  final bool isFromServer; // Add this line

  ChatMessage({
    required this.id,
    required this.chatRoomId,
    required this.message,
    required this.timestamp,
    this.isFromServer = false, // Default to false

  });

  

  // 데이터베이스에 저장하기 위한 맵 변환 함수
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chatRoomId': chatRoomId,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'isFromServer': isFromServer,
    };
  }

  // 맵에서 객체로 변환하는 팩토리 생성자
  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      id: map['id'],
      chatRoomId: map['chatRoomId'],
      message: map['message'],
      timestamp: DateTime.parse(map['timestamp']),
      isFromServer: map['isFromServer'],
    );
  }
}
