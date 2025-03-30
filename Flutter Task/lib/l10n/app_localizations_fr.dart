// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get app_title => 'TuneWave';

  @override
  String get home => 'Accueil';

  @override
  String get songs => 'Chansons';

  @override
  String get favorites => 'Favoris';

  @override
  String get profile => 'Profil';

  @override
  String get play_songs => 'Écouter des Chansons';

  @override
  String get loginFailed => 'Échec de connexion. Veuillez réessayer.';

  @override
  String get signupFailed => 'Échec de l\'inscription. Veuillez réessayer.';

  @override
  String get registrationSuccess => 'Inscription réussie';

  @override
  String get accountCreated => 'Votre compte a été créé avec succès.';

  @override
  String get inputError => 'Erreur de saisie';

  @override
  String get fillAllFields => 'Veuillez remplir tous les champs.';

  @override
  String get invalidEmail => 'Email invalide';

  @override
  String get enterValidEmail => 'Veuillez entrer une adresse email valide.';

  @override
  String get weakPassword => 'Mot de passe faible';

  @override
  String get passwordRequirement => 'Le mot de passe doit contenir au moins 6 caractères.';

  @override
  String get userNotFound => 'Aucun utilisateur trouvé avec cet email.';

  @override
  String get incorrectPassword => 'Mot de passe incorrect. Veuillez réessayer.';

  @override
  String get emailAlreadyRegistered => 'Cet email est déjà enregistré.';

  @override
  String get chooseStrongerPassword => 'Veuillez choisir un mot de passe plus sécurisé.';

  @override
  String get unexpectedError => 'Une erreur inattendue s\'est produite. Veuillez réessayer.';

  @override
  String get ok => 'OK';

  @override
  String get welcomeToTuneWave => 'Bienvenue sur TuneWave';

  @override
  String get email => 'Email';

  @override
  String get password => 'Mot de passe';

  @override
  String get signIn => 'Se connecter';

  @override
  String get dontHaveAccount => 'Vous n\'avez pas de compte ? Inscrivez-vous';
}
