// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'TuneWave';

  @override
  String get home => 'Home';

  @override
  String get songs => 'Songs';

  @override
  String get favorites => 'Favorites';

  @override
  String get profile => 'Profile';

  @override
  String get play_songs => 'Play Songs';

  @override
  String get loginFailed => 'Login failed. Please try again.';

  @override
  String get signupFailed => 'Sign up failed. Please try again.';

  @override
  String get registrationSuccess => 'Registration Successful';

  @override
  String get accountCreated => 'Your account has been created successfully.';

  @override
  String get inputError => 'Input Error';

  @override
  String get fillAllFields => 'Please fill in all fields.';

  @override
  String get invalidEmail => 'Invalid Email';

  @override
  String get enterValidEmail => 'Please enter a valid email address.';

  @override
  String get weakPassword => 'Weak Password';

  @override
  String get passwordRequirement => 'Password must be at least 6 characters long.';

  @override
  String get userNotFound => 'No user found with this email.';

  @override
  String get incorrectPassword => 'Incorrect password. Please try again.';

  @override
  String get emailAlreadyRegistered => 'This email is already registered.';

  @override
  String get chooseStrongerPassword => 'Please choose a stronger password.';

  @override
  String get unexpectedError => 'An unexpected error occurred. Please try again.';

  @override
  String get ok => 'OK';

  @override
  String get welcomeToTuneWave => 'Welcome to TuneWave';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get signIn => 'Sign In';

  @override
  String get dontHaveAccount => 'Don\'t have an account? Sign up';
}
