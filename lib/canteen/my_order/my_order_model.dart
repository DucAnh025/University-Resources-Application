import '/components/button_order_status/button_order_status_widget.dart';
import '/components/my_order_item/my_order_item_widget.dart';
import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'my_order_widget.dart' show MyOrderWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyOrderModel extends FlutterFlowModel<MyOrderWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for ButtonOrderStatus component.
  late ButtonOrderStatusModel buttonOrderStatusModel;
  // Model for MyOrderItem component.
  late MyOrderItemModel myOrderItemModel;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    buttonOrderStatusModel =
        createModel(context, () => ButtonOrderStatusModel());
    myOrderItemModel = createModel(context, () => MyOrderItemModel());
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    buttonOrderStatusModel.dispose();
    myOrderItemModel.dispose();
    navigatorModel.dispose();
  }
}
