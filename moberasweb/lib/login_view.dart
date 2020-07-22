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
  TextEditingController passwordController;
  TextEditingController crmController;
  FocusNode crmFocusNode;
  FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController(text: 'newton123');
    passwordFocusNode = FocusNode();
    crmFocusNode = FocusNode();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MobAppBar(
          title: 'MobEras',
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    /*child: Image.asset(
                      'assets/images/logo_min.png',
                      height: 200, //MediaQuery.of(context).size.height * 0.2,
                    ),*/
                  ),
                ),
                SizedBox(
                  width: 100, //MediaQuery.of(context).size.width * 0.4,
                  child: Divider(
                    color: Colors.lightBlue,
                  ),
                ),
                verticalSpaceMedium,
                Row(
                  children: <Widget>[
                    horizontalSpaceMedium,
                    Expanded(
                      flex: 3,
                      // ignore: missing_required_param
                      child: EmailTextField(
                        key: ValueKey('emailinput'),
                        controller: crmController,
                        focusNode: crmFocusNode,
                        //validator: (_) => local
                        //  .translate(model.validateCrm(crmController.text)),
                        onFieldSubmitted: null,
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                // ignore: missing_required_param
                PasswordTextFormField(
                  key: ValueKey('passwordinput'),
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  onFieldSubmitted: (_) {
                    print('hello there');
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
                  loginMethod: () async {
                    if (!formKey.currentState.validate()) {
                      return Future.value(null);
                    } else {
                      return print; //model.login(
                      //crm: crmController.text,
                      //password: passwordController.text);
                    }
                  },
                ),
                verticalSpaceSmall,
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: GestureDetector(
                      onTap: () => print('Clique para mudar senha'),
                      //onTap: () => model.navigateToPasswordRecovery(),
                      child: Container(
                        width: 175.0,
                        padding: EdgeInsets.all(15.0),
                        color: Colors.transparent,
                        child: Column(children: [
                          Text('Recuperar senha'),
                        ]),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
