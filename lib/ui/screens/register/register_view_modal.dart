import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/shared/base.dart';
import 'package:todo/ui/screens/register/register_connecter.dart';

import '../../../shared/uitls/dialg-uitls.dart';

class RegisterViewModal extends BaseViewModal<RegisterConnector>{
  register(String email, String password,String name,String confirmPassword) async {

    // DialogUtils.loadingDialog(context, "loading...");
    connector!.showLoading("loading...");
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      // DialogUtils.hideDialog(context);
      connector!.hideDialog();

      // DialogUtils.showMessage(context, "successful registration",posActionName: "ok",posActions: (){
      //   Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      //
      // });
      connector!.showMessageError("Successful Registration",);
    } on FirebaseAuthException catch (e) {
      // DialogUtils.hideDialog(context);
      connector!.hideDialog();
      String errorMessage ='SomeThing Went Wrong';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email';
      }
      // DialogUtils.showMessage(context, errorMessage,navActionName: "Try Again",);
      connector!.showMessageError(errorMessage);


    } catch (e) {
      // DialogUtils.hideDialog(context);
      connector!.hideDialog();

      String errorMessage ='SomeThing Went Wrong';
      // DialogUtils.showMessage(context, errorMessage,navActionName: "Try Again",);
      if(email.isNotEmpty&&password.isNotEmpty
         ){
      }
      connector!.showMessageError(e.toString());

    }
  }

}