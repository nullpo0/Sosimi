import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'model/output_page_model.dart';
export 'model/output_page_model.dart';

class OutputPageWidget extends StatefulWidget {
  const OutputPageWidget({super.key});

  @override
  State<OutputPageWidget> createState() => _OutputPageWidgetState();
}

class _OutputPageWidgetState extends State<OutputPageWidget> {
  late OutputPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OutputPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0x00FFFFFF),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Output',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 22,
              letterSpacing: 0,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.65,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/Component1.png'),
                    fit: BoxFit.fill
                  )
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 120),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '잠시만 기다려 주세요...',
                          style: TextStyle(),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 100,
                    borderWidth: 1,
                    buttonSize: MediaQuery.sizeOf(context).width * 0.2,
                    fillColor: Color(0xFF79946E),
                    icon: Icon(
                      Icons.bookmark_border,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 24,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 100,
                    borderWidth: 1,
                    buttonSize: MediaQuery.sizeOf(context).width * 0.2,
                    fillColor: Color(0xFF79946E),
                    icon: Icon(
                      Icons.content_copy,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 24,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 100,
                    borderWidth: 1,
                    buttonSize: MediaQuery.sizeOf(context).width * 0.2,
                    fillColor: Color(0xFF79946E),
                    icon: Icon(
                      Icons.share_sharp,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 24,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
