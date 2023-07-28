import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/shared/uitls/dialg-uitls.dart';

abstract class BaseConnector {
  showMessageError(String message);
  showLoading(String message);
  hideDialog();

}
class BaseViewModal<Con extends BaseConnector> extends ChangeNotifier  {
  Con? connector;

}
abstract class BaseView<VM extends BaseViewModal,T extends StatefulWidget> extends State<T> implements BaseConnector{
  late VM viewModal;
  VM initViewModal();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModal= initViewModal();
  }
  @override
  hideDialog() {
    Navigator.pop(context);
  }

  @override
  showLoading(String message) {
    showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 10,
                ),
                Text(message),
              ],
            ),
          );
        },
        barrierDismissible: false);
  }

  @override
  showMessageError(String message) {
    DialogUtils.showMessage(context, message,navActionName: "Try Again",navAction: () {
      Navigator.pop(context);
    },);
  }
}
