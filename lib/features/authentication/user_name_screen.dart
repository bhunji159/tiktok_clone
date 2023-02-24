import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/email_screen.dart';
import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _userNameController = TextEditingController();

  String _username = '';

  @override
  void initState() {
    super.initState();
    _userNameController.addListener(() {
      setState(() {
        _username = _userNameController.text;
      });
    });
  }

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    if (_username.isEmpty) {
      return;
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Create username",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            const Text(
              "You can always change this later.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black38,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                hintText: "username",
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
            Gaps.v16,
            GestureDetector(
              onTap: _onNextTap,
              child: FormButton(disabled: _username.isEmpty),
            ),
          ],
        ),
      ),
    );
  }
}
