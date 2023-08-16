import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/shared/base.dart';
import 'package:todo/ui/screens/login/connector.dart';
import 'package:todo/ui/screens/login/login_viewmodal.dart';
import 'package:todo/ui/screens/register/register.dart';
import '../../../shared/components/constants.dart';
import '../../../style/app_colors.dart';
import '../../../shared/components/custom_text_field.dart';
import '../../../shared/uitls/dialg-uitls.dart';
import '../../home_layout/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseView<LoginViewModal,LoginScreen> implements LoginConnector{
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModal.connector =this;
  }
  // FirebaseAuth authServes = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context) => viewModal,
    builder: (context, child) => Container(
        decoration: const BoxDecoration(
          color: MyColor.mainBackGround,
          image: DecorationImage(
              image: AssetImage('assets/images/main_bg.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Login",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            centerTitle: true,
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(15),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25),
                      Text(
                        "Welcome back!",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.black, fontSize: 24),
                      ),
                      CustomTextField(
                        controller: emailController,
                        labelText: "E-mail",
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
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade500),
                        onPressed: () {
                          if (formKey.currentState?.validate() == false) {
                            return;
                          }
                          viewModal.login(emailController.text, passwordController.text);
                          // login();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 40),
                                child: Text(
                                  'Login',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.white),
                                )),
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 36,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () => {
                          Navigator.pushNamed(context, RegisterScreen.routeName)
                        },
                        child: Text(
                          'Or Create an Account',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: MyColor.createAccount),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )),
    );
  }

  @override
  NavigateToHome() {
   Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }


  @override
  LoginViewModal initViewModal() {
    return LoginViewModal();
  }


  //
  // void login() async {
  //   if (formKey.currentState?.validate() == false) {
  //     return;
  //   }
  //   DialogUtils.loadingDialog(context, "loading...");
  //   try {
  //     final credential = await authServes.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //     DialogUtils.hideDialog(context);
  //     Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  //   } on FirebaseAuthException catch (e) {
  //     String errorMessage;
  //     if (e.code == 'user-not-found') {
  //       errorMessage = ('Wrong email or password provided for that user.');
  //       DialogUtils.showMessage(context, errorMessage,
  //           navActionName: "try Again", navAction: () {
  //         DialogUtils.hideDialog(context);
  //       });
  //     } else if (e.code == 'wrong-password') {
  //       errorMessage = ('Wrong email or password provided for that user.');
  //       DialogUtils.showMessage(context, errorMessage,
  //           navActionName: "try Again", navAction: () {
  //         DialogUtils.hideDialog(context);
  //       });
  //     }
  //   } catch (e) {
  //     DialogUtils.hideDialog(context);
  //     String errorMessage = 'SomeThing Went Wrong';
  //     DialogUtils.showMessage(context, errorMessage, navActionName: "Try Again",
  //         navAction: () {
  //       login();
  //     });
  //   }
  // }
}
