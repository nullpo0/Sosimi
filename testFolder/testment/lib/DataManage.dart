import 'dart:convert';
import 'package:http/http.dart' as http;

//데이터를 관리하는 소스코드
class DataManage{

  late String category;
  late String api;
  late String k1;
  late String k2;
  late String k3;
  late String k4;

  // 데이터를 json형태로 encoding 후 서버로 전송, 서버로부터 response를 json형태로 받아 decoding
  Future<String> sendJSON(category, k1, k2, k3, k4) async {
    dynamic data = { "k1" : k1, "k2" : k2, "k3" : k3, "k4" : k4};
    String jsonString = jsonEncode(data);
    var response = await http.post(Uri.parse("http://127.0.0.1:8000/$category"),
        headers: {"Content-Type": "application/json"}, body: jsonString);
    return jsonDecode(utf8.decode(response.bodyBytes));
  }
  // 서버로부터 api를 취해 데이터를 얻어옴.
  Future<String> getJSON(api) async {
    var response = await http.get(Uri.parse("http://127.0.0.1:8000/${api}"));
    if (response.statusCode == 200){
      return utf8.decode(response.bodyBytes);
    }
    else{
      return "Exception";
    }
  }
}