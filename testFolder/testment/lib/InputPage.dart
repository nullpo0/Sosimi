import 'package:flutter/material.dart';
import 'package:testment/generatement.dart';
import 'package:testment/DataManage.dart';

// 현재는 테스트용으로 일반화가 되어있지 않음. 하나의 예시만 존재
// statelesswidget으로 구성
class InputPage extends StatelessWidget {
  InputPage({super.key});
  // 키워드 value를 취하기 위한 컨트롤러
  final k1cont = TextEditingController();
  final k2cont = TextEditingController();
  final k3cont = TextEditingController();
  final k4cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          title: Text(
            'Keyword Input',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 0,
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: TextField(
                  controller: k1cont,
                  decoration: InputDecoration(
                    labelText: 'store_name',
                  ),
                )
            ),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: TextField(
                  controller: k2cont,
                  decoration: InputDecoration(
                    labelText: 'menu',
                  ),
                )
            ),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: TextField(
                  controller: k3cont,
                  decoration: InputDecoration(
                    labelText: 'amount',
                  ),
                )
            ),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: TextField(
                  controller: k4cont,
                  decoration: InputDecoration(
                    labelText: 'location',
                  ),
                )
            ),
            ElevatedButton(onPressed: (){ // 버튼 클릭 event
              if (k1cont.text!=""&&k2cont.text!=""&&k3cont.text!=""&&k4cont.text!=""){ // 눌렀을 때 4개의 키워드가 모두 입력 되어 있다면
                var data = DataManage().sendJSON("delivery", k1cont.text, k2cont.text, k3cont.text, k4cont.text); // 데이터를 서버로 post하고 response를 받음
                Navigator.push(context, MaterialPageRoute(builder: (context) => genMent(data))); // generateMentPage로 넘어감
              }
            }, child: Text('Confirm')),
            Padding(padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0))
          ],
        ),
      ),
    );
  }
}
