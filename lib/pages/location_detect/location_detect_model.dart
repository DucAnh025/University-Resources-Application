import '/components/confirm_modal/confirm_modal_widget.dart';
import '/components/line_separator_with_text/line_separator_with_text_widget.dart';
import '/components/navigator_widget.dart';
import '/components/nearest_location_item/nearest_location_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'location_detect_widget.dart' show LocationDetectWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LocationDetectModel extends FlutterFlowModel<LocationDetectWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for lineSeparatorWithText component.
  late LineSeparatorWithTextModel lineSeparatorWithTextModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Model for NearestLocationItem component.
  late NearestLocationItemModel nearestLocationItemModel1;
  // Model for NearestLocationItem component.
  late NearestLocationItemModel nearestLocationItemModel2;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    lineSeparatorWithTextModel =
        createModel(context, () => LineSeparatorWithTextModel());
    nearestLocationItemModel1 =
        createModel(context, () => NearestLocationItemModel());
    nearestLocationItemModel2 =
        createModel(context, () => NearestLocationItemModel());
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    lineSeparatorWithTextModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    nearestLocationItemModel1.dispose();
    nearestLocationItemModel2.dispose();
    navigatorModel.dispose();
  }
}
