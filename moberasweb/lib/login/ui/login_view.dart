import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moberasweb/commons/busy_overlay.dart';
import 'package:moberasweb/commons/ui/email_text_field.dart';
import 'package:moberasweb/commons/ui/login_button.dart';
import 'package:moberasweb/commons/ui/password_text_field.dart';
import 'package:moberasweb/commons/ui_helpers.dart';
import 'package:moberasweb/commons/validators.dart';
import 'package:moberasweb/locator.dart';
import 'package:moberasweb/login/services/authentication_service.dart';
import 'package:moberasweb/login/ui/login_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:string_validator/string_validator.dart';

class LoginView extends StatefulWidget with Validators {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  TextEditingController emailController;
  FocusNode emailFocusNode;

  TextEditingController passwordController;
  FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordController = TextEditingController();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  String validateEmail(String value) {
    if (!isEmail(value.trim())) {
      return 'LocalKeys.invalid_email';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.trim().isEmpty) {
      return 'LocalKeys.password_empty';
    } else if (value.length < 6) {
      return 'LocalKeys.password_short';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => BusyOverlay(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                      Theme.of(context).primaryColor,
                      Colors.white
                    ])),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Form(
                    key: formKey,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/logo_min.png',
                              height: MediaQuery.of(context).size.height * 0.25,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: Divider(
                              color: Colors.lightBlue,
                            ),
                          ),
                          verticalSpaceLarge,

                          EmailTextField(
                            key: ValueKey('emailinput'),
                            controller: emailController,
                            focusNode: emailFocusNode,
                            validator: (value) => validateEmail(value),
                            onFieldSubmitted: (_) {
                              emailFocusNode.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(passwordFocusNode);
                            },
                          ),
                          verticalSpaceMedium,

                          PasswordTextFormField(
                              key: ValueKey('passwordinput'),
                              controller: passwordController,
                              focusNode: passwordFocusNode,
                              onFieldSubmitted: (_) => null,
                              validator: (value) => validatePassword(value)),
                          verticalSpaceMedium,
                          LoginButton(
                            key: ValueKey('loginbutton'),
                            icon: FontAwesomeIcons.signInAlt,
                            color: Color.fromARGB(255, 51, 173, 200),
                            text: 'Login',
                            loginMethod: () async {
                              if (!formKey.currentState.validate()) {
                                return Future.value(null);
                              } else {
                                return model.login(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                          ),
                          verticalSpaceMedium,
                          // InkWell(
                          //     child: Text('Recuperar senha'),
                          //     onTap: () => print('Clicou para recuperar a senha')),
                        ],
                      ),
//                  loginMethod: () async {
//                    if (!formKey.currentState.validate()) {
//                      return Future.value(null);
//                    } else {
//                      return model.login(
//                      crm: crmController.text,
//                      password: passwordController.text);
//                    }
//                  },
                    ),
                  ),
                ),
              ),
            ));
  }
}
