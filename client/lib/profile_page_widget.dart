import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'model/profile_page_model.dart';
export 'model/profile_page_model.dart';


class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  String genderValue = '남';

  String dropDown1Value = '';

  String dropDown2Value = '';

  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> dropDown1List = ['MBTI', 'ISTJ', 'ISTP', 'ISFJ', 'ISFP',
      'INTJ', 'INTP', 'INFJ', 'INFP', 'ESTJ', 'ESTP',
      'ESFJ', 'ESFP', 'ENTJ', 'ENTP', 'ENFJ', 'ENFP'];

    List<String> dropDown2List = ['Job', '고등학생', '대학생', '취업준비생', '직장인'];

    if (dropDown1Value == ""){
      dropDown1Value = dropDown1List.first;
    }
    if (dropDown2Value == ""){
      dropDown2Value = dropDown2List.first;
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            'Profile',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 22,
              letterSpacing: 0,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  height: MediaQuery.sizeOf(context).width * 0.3,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/412/600',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SegmentedButton<String>(
                    segments: const <ButtonSegment<String>>[
                      ButtonSegment<String>(
                        value: '남',
                        label: Text("남"),
                      ),
                      ButtonSegment<String>(
                        value: '여',
                        label: Text("여"),
                      )
                    ],
                    style: SegmentedButton.styleFrom(
                      backgroundColor: Color(0xd0ffffff),
                      foregroundColor: Color(0xd0202020),
                      selectedBackgroundColor: Color(0xff79946E),
                      selectedForegroundColor: Color(0xdfffffff)
                    ),
                    selected: <String>{genderValue},
                    onSelectionChanged: (Set<String> newSelection){
                      setState(() {
                        genderValue = newSelection.first;
                      });
                    },
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0x00000000),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Age',
                          labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                          hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x7E57636C),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF79946E),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                        validator:
                        _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.25,
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0x7E57636C),
                      ),
                    ),
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 4, 8),
                    child: DropdownButton(
                      underline: SizedBox.shrink(),
                      isExpanded: true,
                      hint: Text("MBTI"),
                      value: dropDown1Value,
                      items: dropDown1List.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value)
                        );
                      }).toList(),
                      onChanged: (String? value){
                        setState(() {
                          dropDown1Value = value!;
                        });
                      }
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.31,
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0x7E57636C),
                      ),
                    ),
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 4, 8),
                    child: DropdownButton(
                      underline: SizedBox.shrink(),
                      isExpanded: true,
                      hint: Text("Job"),
                      value: dropDown2Value,
                      items: dropDown2List.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value)
                        );
                      }).toList(),
                      onChanged: (String? value){
                        setState(() {
                          dropDown2Value = value!;
                        });
                      }
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 70, 0),
                  child: FFButtonWidget(
                    onPressed: () {

                    },
                    text: 'Confirm',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      height: MediaQuery.sizeOf(context).height * 0.06,
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Color(0xFF79946E),
                      textStyle:
                      FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        letterSpacing: 0,
                      ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
