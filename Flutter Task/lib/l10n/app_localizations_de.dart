// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get app_title => 'TuneWave';

  @override
  String get home => 'Startseite';

  @override
  String get songs => 'Lieder';

  @override
  String get favorites => 'Favoriten';

  @override
  String get profile => 'Profil';

  @override
  String get play_songs => 'Lieder abspielen';

  @override
  String get loginFailed => 'Anmeldung fehlgeschlagen. Bitte versuchen Sie es erneut.';

  @override
  String get signupFailed => 'Registrierung fehlgeschlagen. Bitte versuchen Sie es erneut.';

  @override
  String get registrationSuccess => 'Registrierung erfolgreich';

  @override
  String get accountCreated => 'Ihr Konto wurde erfolgreich erstellt.';

  @override
  String get inputError => 'Eingabefehler';

  @override
  String get fillAllFields => 'Bitte füllen Sie alle Felder aus.';

  @override
  String get invalidEmail => 'Ungültige E-Mail';

  @override
  String get enterValidEmail => 'Bitte geben Sie eine gültige E-Mail-Adresse ein.';

  @override
  String get weakPassword => 'Schwaches Passwort';

  @override
  String get passwordRequirement => 'Das Passwort muss mindestens 6 Zeichen lang sein.';

  @override
  String get userNotFound => 'Kein Benutzer mit dieser E-Mail gefunden.';

  @override
  String get incorrectPassword => 'Falsches Passwort. Bitte versuchen Sie es erneut.';

  @override
  String get emailAlreadyRegistered => 'Diese E-Mail ist bereits registriert.';

  @override
  String get chooseStrongerPassword => 'Bitte wählen Sie ein stärkeres Passwort.';

  @override
  String get unexpectedError => 'Ein unerwarteter Fehler ist aufgetreten. Bitte versuchen Sie es erneut.';

  @override
  String get ok => 'OK';

  @override
  String get welcomeToTuneWave => 'Willkommen bei TuneWave';

  @override
  String get email => 'E-Mail';

  @override
  String get password => 'Passwort';

  @override
  String get signIn => 'Anmelden';

  @override
  String get dontHaveAccount => 'Sie haben kein Konto? Registrieren';
}
