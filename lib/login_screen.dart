// ignore_for_file: unused_import, unused_field
import 'package:best_flutter_ui_templates/components/component.dart';
import 'package:best_flutter_ui_templates/contras.dart';
import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'navigation_home_screen.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late String _email;
  late String _password;
  bool _saving = false;
  @override
  Widget build(BuildContext context) {
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool isLightMode = brightness == Brightness.light;
    return WillPopScope(
      onWillPop: () async {
        // Navigator.popAndPushNamed(context, HomeScreen.id);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LoadingOverlay(
          isLoading: _saving,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // const TopScreenImage(screenImageName: 'assets/images/inviteImage.png'),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ScreenTitle(title: 'Login'),
                        CustomTextField(
                          textField: TextField(
                              onChanged: (value) {
                                _email = value;
                              },
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              decoration: kTextInputDecoration.copyWith(
                                  hintText: 'Demo')),
                        ),
                        CustomTextField(
                          textField: TextField(
                            obscureText: true,
                            onChanged: (value) {
                              _password = value;
                            },
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: kTextInputDecoration.copyWith(
                                hintText: '1234'),
                          ),
                        ),
                        ElevatedButton(
                          child: Text('Login'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            // side: BorderSide(color: Colors.yellow, width: 5),
                            textStyle: const TextStyle(
                              color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                            shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(3))),
                            shadowColor: Colors.lightBlue,           
                          ),
                          onPressed: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => NavigationHomeScreen())),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
















