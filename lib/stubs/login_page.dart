String stubLoginPage() => '''
import 'package:flutter/material.dart';
import '/resources/widgets/logo_widget.dart';
import '/resources/widgets/buttons_widget.dart';
import '/resources/widgets/text_fields_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class LoginPage extends NyStatefulWidget {
  final Controller controller = Controller();

  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends NyState<LoginPage> {

  TextEditingController _txtEmailController = TextEditingController(),
      _txtPasswordController = TextEditingController();
  
  @override
  init() async {
    whenEnv('developing', perform: () {
      _txtEmailController.text = 'fake@gmail.com';
      _txtPasswordController.text = 'password';
    });
  }

  loginUser() async {
    String email = _txtEmailController.text;
    String password = _txtPasswordController.text;
    
    await lockRelease('login', perform: () async {
      /// handle login
      await Future.delayed(Duration(seconds: 2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Logo(
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      height: 60,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Welcome back',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  child: Column(children: <Widget>[
                    PrimaryTextFieldWidget(
                      controller: _txtEmailController,
                      labelText: "EMAIL",
                      enableSuggestions: false,
                      textInputType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    PrimaryTextFieldWidget(
                      controller: _txtPasswordController,
                      labelText: "PASSWORD",
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    PrimaryButtonWidget(
                      action: loginUser,
                      text: "Log in",
                      isLoading: isLocked('login'),
                    ),
                  ]),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: AlignmentDirectional.center,
                      child: InkWell(
                        child: Text(
                          'Forgot your password?',
                        ),
                        onTap: () =>
                            Navigator.pushNamed(context, "/forgot-password"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
''';
