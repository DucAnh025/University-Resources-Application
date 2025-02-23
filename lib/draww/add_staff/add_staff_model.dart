import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_staff_widget.dart' show AddStaffWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddStaffModel extends FlutterFlowModel<AddStaffWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode1;
  TextEditingController? userNameTextFieldTextController1;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextController1Validator;
  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode2;
  TextEditingController? userNameTextFieldTextController2;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextController2Validator;
  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode3;
  TextEditingController? userNameTextFieldTextController3;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextController3Validator;
  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode4;
  TextEditingController? userNameTextFieldTextController4;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextController4Validator;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userNameTextFieldFocusNode1?.dispose();
    userNameTextFieldTextController1?.dispose();

    userNameTextFieldFocusNode2?.dispose();
    userNameTextFieldTextController2?.dispose();

    userNameTextFieldFocusNode3?.dispose();
    userNameTextFieldTextController3?.dispose();

    userNameTextFieldFocusNode4?.dispose();
    userNameTextFieldTextController4?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    navigatorModel.dispose();
  }
}
