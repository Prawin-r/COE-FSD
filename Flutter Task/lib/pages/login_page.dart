import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/l10n/app_localizations.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  final Function(Locale) onLanguageChanged; // Function to update language
  const LoginPage({super.key, required this.onLanguageChanged});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  late Locale _selectedLocale;

  @override
  void initState() {
    super.initState();
    _selectedLocale = const Locale('en'); // Default to English
  }

  @override
  void didUpdateWidget(covariant LoginPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.onLanguageChanged != oldWidget.onLanguageChanged) {
      setState(() {
        _selectedLocale = widget.onLanguageChanged as Locale;
      });
    }
  }

  Future<void> _signIn() async {
    if (!_validateInputs()) return;
    setState(() => _isLoading = true);

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      User? user = userCredential.user;
      if (user != null) {
        FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': user.email,
          'lastLogin': DateTime.now(),
        }, SetOptions(merge: true));
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      _showErrorDialog(
        AppLocalizations.of(context).loginFailed,
        _getErrorMessage(e.toString()),
      );
    }
    setState(() => _isLoading = false);
  }

  Future<void> _signUp() async {
    if (!_validateInputs()) return;
    setState(() => _isLoading = true);

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      User? user = userCredential.user;
      if (user != null) {
        FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': user.email,
          'createdAt': DateTime.now(),
        });

        _showSuccessDialog(
          AppLocalizations.of(context).registrationSuccess,
          AppLocalizations.of(context).accountCreated,
        );
      }
    } catch (e) {
      _showErrorDialog(
        AppLocalizations.of(context).signupFailed,
        _getErrorMessage(e.toString()),
      );
    }
    setState(() => _isLoading = false);
  }

  bool _validateInputs() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      _showErrorDialog(
        AppLocalizations.of(context).inputError,
        AppLocalizations.of(context).fillAllFields,
      );
      return false;
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text.trim())) {
      _showErrorDialog(
        AppLocalizations.of(context).invalidEmail,
        AppLocalizations.of(context).enterValidEmail,
      );
      return false;
    }
    if (passwordController.text.length < 6) {
      _showErrorDialog(
        AppLocalizations.of(context).weakPassword,
        AppLocalizations.of(context).passwordRequirement,
      );
      return false;
    }
    return true;
  }

  String _getErrorMessage(String error) {
    if (error.contains('user-not-found')) {
      return AppLocalizations.of(context).userNotFound;
    }
    if (error.contains('wrong-password')) {
      return AppLocalizations.of(context).incorrectPassword;
    }
    if (error.contains('email-already-in-use')) {
      return AppLocalizations.of(context).emailAlreadyRegistered;
    }
    if (error.contains('weak-password')) {
      return AppLocalizations.of(context).chooseStrongerPassword;
    }
    return AppLocalizations.of(context).unexpectedError;
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context).ok),
              ),
            ],
          ),
    );
  }

  void _showSuccessDialog(String title, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context).ok),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).welcomeToTuneWave,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<Locale>(
              value: _selectedLocale,
              hint: const Text(
                "Language",
                style: TextStyle(color: Colors.white),
              ), // Default text before selection

              dropdownColor: Colors.black,
              items: const [
                DropdownMenuItem(
                  value: Locale('en'),
                  child: Text("English", style: TextStyle(color: Colors.white)),
                ),
                DropdownMenuItem(
                  value: Locale('es'),
                  child: Text("Español", style: TextStyle(color: Colors.white)),
                ),
                DropdownMenuItem(
                  value: Locale('de'),
                  child: Text("German", style: TextStyle(color: Colors.white)),
                ),
                DropdownMenuItem(
                  value: Locale('ta'),
                  child: Text("Tamil", style: TextStyle(color: Colors.white)),
                ),
                DropdownMenuItem(
                  value: Locale('fr'),
                  child: Text("French", style: TextStyle(color: Colors.white)),
                ),
              ],
              onChanged: (Locale? newLocale) {
                if (newLocale != null) {
                  setState(() {
                    _selectedLocale = newLocale; // Update the state
                  });
                  widget.onLanguageChanged(
                    _selectedLocale,
                  ); // Update language globally
                }
              },
              style: const TextStyle(
                color: Colors.white,
              ), // Ensure text is visible
            ),

            const SizedBox(height: 15),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).email,
                prefixIcon: const Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 0, 16, 106),
                ),
                filled: true,
                fillColor: Colors.white10,
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).password,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Color.fromARGB(255, 0, 21, 95),
                ),
                filled: true,
                fillColor: Colors.white10,
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              obscureText: true,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator(
                  color: Color.fromARGB(255, 1, 15, 86),
                )
                : Column(
                  children: [
                    ElevatedButton(
                      onPressed: _signIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          245,
                          245,
                          245,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 40,
                        ),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: Text(AppLocalizations.of(context).signIn),
                    ),
                    TextButton(
                      onPressed: _signUp,
                      child: Text(
                        AppLocalizations.of(context).dontHaveAccount,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 249, 249, 249),
                        ),
                      ),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
