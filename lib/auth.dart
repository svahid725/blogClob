import 'package:blog_club/Home.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/main.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  static int selectedTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {
    final ThemeData themData = Theme.of(context);
    final tabTextStyle = TextStyle(
        color: themData.colorScheme.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold);

    return Scaffold(
      backgroundColor: themData.colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Assets.img.icons.logo.svg(width: 120, height: 60),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(28),
                      topLeft: Radius.circular(28)),
                  color: themData.colorScheme.primary,
                ),
                child: Column(children: [
                  SizedBox(
                    height: 64,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTabIndex = loginTab;
                                });
                              },
                              child: Text('LOGIN',
                                  style: tabTextStyle.apply(
                                      color: selectedTabIndex == loginTab
                                          ? Colors.white
                                          : Colors.white30))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTabIndex = signUpTab;
                                });
                              },
                              child: Text('SIGN UP',
                                  style: tabTextStyle.apply(
                                      color: selectedTabIndex == signUpTab
                                          ? Colors.white
                                          : Colors.white30))),
                        ]),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(40, 32, 40, 10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(28),
                              topRight: Radius.circular(28)),
                          color: Colors.white),
                      child: SingleChildScrollView(
                        child: selectedTabIndex == loginTab
                            ? Login(themData: themData)
                            : SignUp(themData: themData),
                      ),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({
    Key? key,
    required this.themData,
  }) : super(key: key);

  final ThemeData themData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back',
          style: themData.textTheme.headline4,
        ),
        const SizedBox(height: 12),
        Text(
          'Sign in with your account',
          style: themData.textTheme.subtitle1!.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
              label: Text('Username', style: themData.textTheme.subtitle1)),
        ),
        const SizedBox(height: 15),
        PasswordTextField(themData: themData),
        const SizedBox(height: 30),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) =>const MainSreenState()));
            },
            child: const Text('LOGIN'),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Forgot your password?',
                style: themData.textTheme.subtitle1!.copyWith(fontSize: 14)),
            const SizedBox(width: 5),
            TextButton(
                onPressed: () { Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) =>const MainSreenState()));},
                child: Text('Reset here',
                    style: themData.textTheme.subtitle1!
                        .copyWith(fontSize: 14, color: MyApp.blueTextColor)))
          ],
        ),
        const SizedBox(height: 30),
        Center(
            child: Text('OR SIGN IN WITH',
                style: themData.textTheme.subtitle1!
                    .copyWith(fontSize: 12, letterSpacing: 2))),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(width: 32),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(width: 32),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({
    Key? key,
    required this.themData,
  }) : super(key: key);

  final ThemeData themData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to Blog Club',
          style: themData.textTheme.headline4,
        ),
        const SizedBox(height: 12),
        Text(
          'Please enter your information',
          style: themData.textTheme.subtitle1!.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 15),
        TextField(
          decoration: InputDecoration(
              label: Text('Name', style: themData.textTheme.subtitle1)),
        ),
        const SizedBox(height: 15),
        TextField(
          decoration: InputDecoration(
              label: Text('Username', style: themData.textTheme.subtitle1)),
        ),
        const SizedBox(height: 15),
        PasswordTextField(themData: themData),
        const SizedBox(height: 30),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Sign Up'),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const SizedBox(height: 30),
        Center(
            child: Text('OR SIGN UP WITH',
                style: themData.textTheme.subtitle1!
                    .copyWith(fontSize: 12, letterSpacing: 2))),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(width: 32),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(width: 32),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.themData,
  }) : super(key: key);

  final ThemeData themData;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          label: Text('Password', style: widget.themData.textTheme.subtitle1),
          suffix: InkWell(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Text(obscureText ? 'Show' : 'Hide',
                style: widget.themData.textTheme.subtitle1!
                    .copyWith(fontSize: 14)),
          )),
    );
  }
}
