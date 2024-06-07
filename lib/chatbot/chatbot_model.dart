import '/flutter_flow/flutter_flow_util.dart';
import 'chatbot_widget.dart' show ChatbotWidget;
import 'package:flutter/material.dart';

class ChatbotModel extends FlutterFlowModel<ChatbotWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField-Question widget.
  FocusNode? textFieldQuestionFocusNode;
  TextEditingController? textFieldQuestionTextController;
  String? Function(BuildContext, String?)?
      textFieldQuestionTextControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in IconButton widget.
  String? answer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldQuestionFocusNode?.dispose();
    textFieldQuestionTextController?.dispose();
  }
}
