import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// statefulWiget으로 구성
class genMent extends StatefulWidget {

  var data;

  genMent(this.data);


  @override
  State<genMent> createState() => _genMentState();
}

class _genMentState extends State<genMent> {
  // 화면 넘어온 직후엔 화면이 뜨는게 생성멘트를 받아오는 것 보다 빠름
  String result = "잠시만 기다려주세요";
  // 따라서 initstate에서 서버로부터 response를 기다리면서 비동기로 처리
  // 생성 멘트가 도착하면 setstate에 따라 result를 생성 멘트로 변경
  @override
  void initState(){
    super.initState();
    widget.data.then((data){
          setState(() {
            print(data);
            result = data;
          });
        });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          title: Text(
            'generate ment',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 0,
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  width: 350,
                  height: 488,
                  decoration: BoxDecoration(
                    color: Color(0xFFE3E3E3),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(
                          0,
                          2,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(-1, -1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
                      child: Text(
                        result,
                        softWrap: true,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
