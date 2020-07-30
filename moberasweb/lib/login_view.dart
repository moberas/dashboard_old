import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:moberasweb/authentication_service.dart';
import 'package:moberasweb/email_text_field.dart';
import 'package:moberasweb/local_keys.dart';
import 'package:moberasweb/locator.dart';
import 'package:moberasweb/login_button.dart';
import 'package:moberasweb/login_viewmodel.dart';
import 'package:moberasweb/mobappbar.dart';
import 'package:moberasweb/password_text_field.dart';
import 'package:moberasweb/ui_helpers.dart';
import 'login_viewmodel.dart';
import 'package:moberasweb/validators.dart';
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

  Future<void> login(
      {@required String email, @required String password}) async {
    print('Hello There');
    print(validateEmail(email));
    print(validatePassword(password));
    //setBusy(true);
    var success = await _authenticationService.login(email, password);
    if (success) {
      print('login efetuado com sucessso');
      //unawaited(_navigationService.navigateTo(Routes.startupViewRouter));
    } else {
      //_snackbarService.showSnackbar(
      //    message: 'Usuário ou senha inválidos', title: 'Login', barBlur: 10.0);
      print('Usuário ou senha inválidos');
    }
    //setBusy(false);
  }

  String validateEmail(String value) {
    if (!isEmail(value.trim())) {
      return LocalKeys.invalid_email;
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.trim().isEmpty) {
      return LocalKeys.password_empty;
    } else if (value.length < 6) {
      return LocalKeys.password_short;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return /*ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => BusyOverlay(
        title: 'Por favor aguarde...',
        show: model.isBusy,
        child:*/
        Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [Theme.of(context).primaryColor, Colors.white])),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
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
                // ignore: missing_required_param
                EmailTextField(
                  key: ValueKey('emailinput'),
                  controller: emailController,
                  focusNode: emailFocusNode,
                  //validator: (_) => local
                  //  .translate(model.validateCrm(crmController.text)),
                  onFieldSubmitted: (_) => print('Email field submitted'),
                ),
                verticalSpaceMedium,
                // ignore: missing_required_param
                PasswordTextFormField(
                  key: ValueKey('passwordinput'),
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  onFieldSubmitted: (_) {
                    print('Password field submitted');
                    //if (!formKey.currentState.validate()) return;
                    //model.login(
                    //: crmController.text,
                    //password: passwordController.text,
                    //);
                  },
                  //validator: (_) => local
                  //.translate(model.validatePassword(passwordController.text)),
                ),
                verticalSpaceMedium,
                LoginButton(
                  key: ValueKey('loginbutton'),
                  icon: FontAwesomeIcons.signInAlt,
                  color: Color.fromARGB(255, 51, 173, 200),
                  text: 'Login',
                  loginMethod: () => print('Clicou no botão de login.'),
                  /*loginMethod: () async {
                        if (!formKey.currentState.validate()) {
                          return Future.value(null);
                        } else {
                          return model.login(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },*/
                ),
                verticalSpaceMedium,
                InkWell(
                    child: Text('Recuperar senha'),
                    onTap: () => print('Clicou para recuperar a senha')),
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
    );
  }
}
