import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/shared/base.dart';
import 'package:todo/ui/screens/login/connector.dart';

class LoginViewModal extends BaseViewModal<LoginConnector>{
// late  LoginConnector connector ;
  void login(String email, String password) async {

    // DialogUtils.loadingDialog(context, "loading...");
    connector!.showLoading("Loading.....");

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // DialogUtils.hideDialog(context);
      connector!.hideDialog();
      // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      connector!.NavigateToHome();
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = ('Wrong email or password provided for that user.');
        // DialogUtils.showMessage(context, errorMessage,
        //     navActionName: "try Again", navAction: () {
        //       DialogUtils.hideDialog(context);
        //     });
        connector!.showMessageError(errorMessage);
      } else if (e.code == 'wrong-password') {
        errorMessage = ('Wrong email or password provided for that user.');
        // DialogUtils.showMessage(context, errorMessage,
        //     navActionName: "try Again", navAction: () {
        //       DialogUtils.hideDialog(context);
        //     });
        connector!.showMessageError(errorMessage);


      }
    } catch (e) {
      // DialogUtils.hideDialog(context);
      connector!.hideDialog();

      String errorMessage = 'SomeThing Went Wrong';
      // DialogUtils.showMessage(context, errorMessage, navActionName: "Try Again",
      //     navAction: () {
      //       login();
      //     });
      connector!.showMessageError(errorMessage);

    }
  }
}