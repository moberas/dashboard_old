import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moberasweb/email_text_field.dart';
import 'package:moberasweb/login_button.dart';
import 'package:moberasweb/mobappbar.dart';
import 'package:moberasweb/password_text_field.dart';
import 'package:moberasweb/ui_helpers.dart';
//import 'login_viewmodel.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobAppBar(
        title: 'MobEras',
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
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
                verticalSpaceMedium,
                InkWell(
                      child: Text('Recuperar senha'),
                      onTap: () => print('Clicou para recuperar a senha')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

