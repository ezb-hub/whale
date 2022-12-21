import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';
  bool rememberMe = false;

  Color getColor(Set<MaterialState> states) {
    return Theme.of(context).primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(0),
                  child: const Text('SIGN IN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w500)),
                ),
                const SizedBox(height: 60),
                TextFormField(
                  enableSuggestions: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username.';
                    }

                    if (value.length < 4) {
                      return 'Your username too short.';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16),
                    hintStyle: const TextStyle(fontSize: 14),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: 'Username',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  onSaved: (val) => setState(() => username = val.toString()),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password.';
                    }

                    if (value.length < 8) {
                      return 'Your password too short.';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16),
                    hintStyle: const TextStyle(fontSize: 14),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: 'Password',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                  ),
                  onSaved: (val) => setState(() => password = val.toString()),
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                    activeColor: Theme.of(context).primaryColor,
                    contentPadding: const EdgeInsets.all(0),
                    title: const Text("Remember Me"),
                    value: rememberMe,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (val) {
                      setState(() => rememberMe = val!);
                    }),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(16.0),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          final form = _formKey.currentState;

                          if (form != null && form.validate()) {
                            form.save();
                            print(username);
                            print(password);
                          }
                        },
                        child: const Text(
                          'Sign In',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton.small(
        elevation: 0,
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
    );
  }
}
