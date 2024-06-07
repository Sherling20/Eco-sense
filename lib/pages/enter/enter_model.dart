import '/flutter_flow/flutter_flow_util.dart';
import 'enter_widget.dart' show EnterWidget;
import 'package:flutter/material.dart';

class EnterModel extends FlutterFlowModel<EnterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
