// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get app_title => 'TuneWave';

  @override
  String get home => 'Inicio';

  @override
  String get songs => 'Canciones';

  @override
  String get favorites => 'Favoritos';

  @override
  String get profile => 'Perfil';

  @override
  String get play_songs => 'Reproducir Canciones';

  @override
  String get loginFailed => 'Error de inicio de sesión. Inténtalo de nuevo.';

  @override
  String get signupFailed => 'Error al registrarse. Inténtalo de nuevo.';

  @override
  String get registrationSuccess => 'Registro exitoso';

  @override
  String get accountCreated => 'Tu cuenta ha sido creada con éxito.';

  @override
  String get inputError => 'Error de entrada';

  @override
  String get fillAllFields => 'Por favor, complete todos los campos.';

  @override
  String get invalidEmail => 'Correo electrónico no válido';

  @override
  String get enterValidEmail => 'Por favor, introduce una dirección de correo electrónico válida.';

  @override
  String get weakPassword => 'Contraseña débil';

  @override
  String get passwordRequirement => 'La contraseña debe tener al menos 6 caracteres.';

  @override
  String get userNotFound => 'No se encontró un usuario con este correo electrónico.';

  @override
  String get incorrectPassword => 'Contraseña incorrecta. Inténtalo de nuevo.';

  @override
  String get emailAlreadyRegistered => 'Este correo electrónico ya está registrado.';

  @override
  String get chooseStrongerPassword => 'Elige una contraseña más segura.';

  @override
  String get unexpectedError => 'Ocurrió un error inesperado. Inténtalo de nuevo.';

  @override
  String get ok => 'Aceptar';

  @override
  String get welcomeToTuneWave => 'Bienvenido a TuneWave';

  @override
  String get email => 'Correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get dontHaveAccount => '¿No tienes una cuenta? Regístrate';
}
