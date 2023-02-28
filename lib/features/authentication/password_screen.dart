import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreemState();
}

class _PasswordScreemState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = '';
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordLengthValid() {
    if (_password.length < 8 || _password.length > 20) return false;
    return true;
  }

  bool _isPasswordValid() {
    final regExp = RegExp(
        r"(?=^)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&amp;*()_+}{&quot;:;'?/&gt;.&lt;,])(?!.*\s).*$");
    if (!regExp.hasMatch(_password)) return false;
    return true;
  }

  void _onSubmit() {
    if (!_isPasswordLengthValid() || !_isPasswordValid()) return;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const BirthdayScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "What is your Password?",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                onEditingComplete: () => _onSubmit(),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: _passwordController,
                obscureText: _isObscured,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => _passwordController.clear(),
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h10,
                      GestureDetector(
                        onTap: () => setState(() {
                          _isObscured = !_isObscured;
                        }),
                        child: FaIcon(
                          _isObscured
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v10,
              const Text(
                'Your password must have:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color: _isPasswordLengthValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                    size: Sizes.size20,
                  ),
                  Gaps.h5,
                  const Text("8 to 20 characters"),
                ],
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color: _isPasswordValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                    size: Sizes.size20,
                  ),
                  Gaps.h5,
                  const AutoSizeText(
                    'Letters, numbers, and special characters',
                    maxLines: 1,
                  ),
                ],
              ),
              Gaps.v16,
              GestureDetector(
                onTap: () => _onSubmit(),
                child: FormButton(
                  disabled: !_isPasswordLengthValid() || !_isPasswordValid(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
