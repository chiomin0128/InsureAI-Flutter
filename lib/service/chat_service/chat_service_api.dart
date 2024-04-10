import 'dart:async';
import 'dart:convert';
import 'dart:io';

class ChatServiceAPI {
  Stream<String> sendRequest(String messageText) async* {
    var requestUri = Uri.parse('http://127.0.0.1:8000/chat/stream');
    var httpClient = HttpClient();

    try {
      var request = await httpClient.postUrl(requestUri);
      request.headers.set(HttpHeaders.contentTypeHeader, "application/json");
      request.add(utf8.encode(json.encode({
        'user_no': 324,
        'query': messageText,
        'source': "data/txt/(무)퍼펙트플러스종합보험(세만기형)(Hi2110)_상품요약서.txt"
      })));

      var response = await request.close();
      await for (var contents in response.transform(Utf8Decoder())) {
        yield contents; // 스트림에 데이터를 추가하여 실시간으로 소비할 수 있게 함
      }
    } catch (e) {
      print("Error sending request: $e");
      yield 'Error: $e'; // 오류 발생 시 스트림에 오류 메시지 추가
    } finally {
      httpClient.close();
    }
  }
}
