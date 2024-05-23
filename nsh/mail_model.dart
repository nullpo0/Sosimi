import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'input_copy_copy_copy_widget.dart' show InputCopyCopyCopyWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputCopyCopyCopyModel extends FlutterFlowModel<InputCopyCopyCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
