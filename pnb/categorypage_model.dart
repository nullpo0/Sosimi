import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'categorypage_widget.dart' show CategorypageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategorypageModel extends FlutterFlowModel<CategorypageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
