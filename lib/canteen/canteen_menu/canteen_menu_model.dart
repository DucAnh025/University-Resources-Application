import '/components/navigator_widget.dart';
import '/components/top_of_week_item/top_of_week_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'canteen_menu_widget.dart' show CanteenMenuWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CanteenMenuModel extends FlutterFlowModel<CanteenMenuWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for TopOfWeekItem component.
  late TopOfWeekItemModel topOfWeekItemModel;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    topOfWeekItemModel = createModel(context, () => TopOfWeekItemModel());
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    topOfWeekItemModel.dispose();
    navigatorModel.dispose();
  }
}
