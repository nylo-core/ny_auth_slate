String stubRegisterPage() => '''
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/app/controllers/controller.dart';
import '/resources/widgets/buttons_widget.dart';
import '/resources/widgets/logo_widget.dart';
import '/resources/widgets/text_fields_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterPage extends NyStatefulWidget {
  final Controller controller = Controller();
  
  static String path = '/login';

  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends NyState<RegisterPage> {
  TextEditingController _txtNameController = TextEditingController(),
      _txtEmailController = TextEditingController(),
      _txtPasswordController = TextEditingController();

  @override
  init() async {
    whenEnv('developing', perform: () {
      _txtEmailController.text = "Anthony@mail.com";
      _txtNameController.text = "Anthony";
      _txtPasswordController.text = "Password";
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _isProcessing = false;
  String? dateOfBirth;

  registerUser() async {
    String name = _txtNameController.text;
    String email = _txtEmailController.text;
    String password = _txtPasswordController.text;

    await lockRelease('register', perform: () async {
      /// handle the registration
    });
  }

  @override
  void initState() {
    super.initState();
    _isProcessing = false;
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
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
                        Container(
                          child: Logo(
                            height: 30,
                            width: 50,
                          ),
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Column(children: <Widget>[
                        ListView(
                          shrinkWrap: true,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: PrimaryTextFieldWidget(
                                    controller: _txtNameController,
                                    labelText: "Name",
                                    autoFocus: true,
                                    obscureText: false,
                                  ),
                                ),
                              ],
                            ),
                            PrimaryTextFieldWidget(
                              controller: _txtEmailController,
                              labelText: "Email",
                              textInputType: TextInputType.emailAddress,
                              autoFocus: false,
                              enableSuggestions: false,
                              obscureText: false,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: PrimaryTextFieldWidget(
                                    controller: _txtPasswordController,
                                    labelText: "Password",
                                    obscureText: true,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            PrimaryButtonWidget(
                              action: registerUser,
                              text: "Create account",
                              isLoading: isLocked('register'),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                            text: 'By tapping "Create account", you agree to our ',
                          ),
                          new TextSpan(
                            text: 'terms and conditions',
                            style: new TextStyle(fontWeight: FontWeight.bold),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => launchUrl(termsUrl()),
                          ),
                          new TextSpan(text: '. You can also view our '),
                          new TextSpan(
                            text: 'privacy policy',
                            style: new TextStyle(fontWeight: FontWeight.bold),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => launchUrl(privacyUrl()),
                          ),
                          new TextSpan(text: ' here.'),
                        ],
                      ),
                    ),
                  ]),
              Container(
                height: 40.0,
                color: Colors.transparent,
                child: Container(
                  child: MaterialButton(
                    onPressed: () =>
                    _isProcessing == true ? () {} : Navigator.pop(context),
                    child: Text(
                      "Back",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Uri privacyUrl() => Uri.parse("\${getEnv('APP_URL')}/\${Uri.parse("privacy-policy")}");

  Uri termsUrl() => Uri.parse("\${getEnv('APP_URL')}/\${Uri.parse("terms-and-conditions")}");
}
''';
