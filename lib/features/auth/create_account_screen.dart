import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_auth_clone/features/auth/customize_screen.dart';
import 'package:twitter_auth_clone/constant/gaps.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  bool nameValid = false;
  bool emailValid = false;

  late FocusNode _dateFocused;
  bool isDateFocused = false;

  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateFocused = FocusNode();
    _dateFocused.addListener(() {
      setState(() {
        isDateFocused = _dateFocused.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _dateFocused.dispose();
    _dateController.dispose();
    super.dispose();
  }

  DateTime initialDate =
      DateTime.now().subtract(const Duration(days: 365 * 12));

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _isNameValid(String name) {
    if (name.length > 2) {
      nameValid = true;
      setState(() {});
    } else {
      nameValid = false;
      setState(() {});
    }
  }

  void _isEmailValid(String email) {
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (regExp.hasMatch(email)) {
      emailValid = true;
      setState(() {});
    } else {
      emailValid = false;
      setState(() {});
    }
  }

  void _onNextTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CustomizeScreen(
              formData: formData,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const FaIcon(
            FontAwesomeIcons.twitter,
            size: Sizes.size36,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gaps.v24,
                      const Text(
                        "Create your account",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Sizes.size32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.v24,
                      TextFormField(
                        style: TextStyle(
                          color: Colors.blue.shade400,
                        ),
                        decoration: InputDecoration(
                          labelText: "Name",
                          suffixIcon: nameValid
                              ? const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                              : null,
                        ),
                        onSaved: (newValue) {
                          if (newValue != null && nameValid == true) {
                            formData["name"] = newValue;
                          }
                        },
                        onChanged: (value) => _isNameValid(value),
                      ),
                      Gaps.v16,
                      TextFormField(
                        style: TextStyle(
                          color: Colors.blue.shade400,
                        ),
                        decoration: InputDecoration(
                          labelText: "Email address",
                          suffixIcon: emailValid
                              ? const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                              : null,
                        ),
                        onSaved: (newValue) {
                          if (newValue != null) {
                            formData["email"] = newValue;
                          }
                        },
                        onChanged: (value) => _isEmailValid(value),
                      ),
                      Gaps.v16,
                      TextFormField(
                        controller: _dateController,
                        readOnly: true,
                        focusNode: _dateFocused,
                        style: TextStyle(
                          color: Colors.blue.shade400,
                        ),
                        decoration: InputDecoration(
                          labelText: "Date of birth",
                          helperText: _dateFocused.hasFocus
                              ? "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else."
                              : null,
                          helperMaxLines: 3,
                          suffixIcon: _dateController.text.isNotEmpty
                              ? const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                              : null,
                        ),
                        onSaved: (newValue) {
                          if (newValue != null) {
                            formData["birthday"] = newValue;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: nameValid &&
                              emailValid &&
                              _dateController.text.isNotEmpty
                          ? _onNextTap
                          : null,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(
                          vertical: Sizes.size28,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size16, vertical: Sizes.size6),
                        decoration: BoxDecoration(
                          color: nameValid &&
                                  emailValid &&
                                  _dateController.text.isNotEmpty
                              ? Colors.black
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: isDateFocused
            ? BottomAppBar(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  maximumDate: initialDate,
                  initialDateTime: initialDate,
                  onDateTimeChanged: (date) {
                    setState(() {
                      _dateController.text = date.toString().split(" ").first;
                    });
                  },
                ),
              )
            : null,
      ),
    );
  }
}
