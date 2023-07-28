import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/ui/screens/login/login.dart';
import 'package:todo/ui/screens/register/register_connecter.dart';
import 'package:todo/ui/screens/register/register_view_modal.dart';
import '../../../shared/base.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/components/custom_text_field.dart';
import '../../../shared/uitls/dialg-uitls.dart';
import '../../../style/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseView<RegisterViewModal,RegisterScreen> implements RegisterConnector {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPassController = TextEditingController();

  // FirebaseAuth authServes = FirebaseAuth.instance;
@override
  void initState() {
  super.initState();
    viewModal.connector=this;
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => viewModal,
    builder: (context, child) => Container(
      decoration: const BoxDecoration(

        color: MyColor.mainBackGround,

        image: DecorationImage(
            image: AssetImage('assets/images/main_bg.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Create Account",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  CustomTextField(
                    controller: nameController,
                    labelText: "Full Name",
                    keyType: TextInputType.name,
                    icon: Icon(Icons.person),
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please enter Full name  ";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: emailController,
                    labelText: "E-mail-Address",
                    keyType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please enter correct Email ";
                      }
                      if (!Validation.isValid(text)) {
                        return "Please Enter Valid Email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    labelText: "Password",
                    obscure: true,
                    icon: Icon(Icons.remove_red_eye_outlined),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "please enter  password ";
                      } else if (text.length < 6) {
                        return 'Please enter 6 chars';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: confirmPassController,
                    labelText: "Confirm-Password",
                    obscure: true,
                    icon: Icon(Icons.remove_red_eye_outlined),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "please Confirm password ";
                      } else if (text.length < 6) {
                        return 'Please enter 6 chars';
                      } else if (passwordController.text != text) {
                        return "Confirm Password is not match";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() == false) {
                        }
                        viewModal.register(emailController.text, passwordController.text,nameController.text,confirmPassController.text);
                        // register();
                        //    if(nameController.text.isNotEmpty&&emailController.text.isNotEmpty
                        //        &&passwordController.text.isNotEmpty
                        //        &&confirmPassController.text.isNotEmpty){
                        //    }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              child: Text(
                                'Create Account',
                                style: Theme.of(context).textTheme.bodyMedium,
                              )),
                          const Icon(
                            Icons.arrow_forward,
                            color: MyColor.buttonBackGround,
                            size: 36,
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    ),);
  }

  @override
  RegisterViewModal initViewModal() {
    return RegisterViewModal();
  }

  @override
  NavigateToLogin() {
Navigator.pushReplacementNamed(context, LoginScreen.routeName);

}

  @override
  SuccessfulRegistration() {
    DialogUtils.showMessage(context, "Successful Registration",posActionName: "OK",posActions: () {
      NavigateToLogin();
    },);
  }

  // register() async {
  //
  //   DialogUtils.loadingDialog(context, "loading...");
  //   try {
  //      await authServes.createUserWithEmailAndPassword(
  //         email: emailController.text, password: passwordController.text);
  //     DialogUtils.hideDialog(context);
  //     DialogUtils.showMessage(context, "successful registration",posActionName: "ok",posActions: (){
  //       Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  //
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     DialogUtils.hideDialog(context);
  //     String errorMessage ='SomeThing Went Wrong';
  //     if (e.code == 'weak-password') {
  //       errorMessage = 'The password provided is too weak.';
  //     } else if (e.code == 'email-already-in-use') {
  //       errorMessage = 'The account already exists for that email';
  //     }
  //     DialogUtils.showMessage(context, errorMessage,navActionName: "Try Again",);
  //
  //   } catch (e) {
  //     DialogUtils.hideDialog(context);
  //     String errorMessage ='SomeThing Went Wrong';
  //     DialogUtils.showMessage(context, errorMessage,navActionName: "Try Again",);
  //   }
  // }
}
