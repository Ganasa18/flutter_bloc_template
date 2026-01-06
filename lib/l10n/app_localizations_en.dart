// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeScreenTitle => 'Home Screen';

  @override
  String get selectedUserTitle => 'Selected user';

  @override
  String get unknownName => 'Unknown';

  @override
  String get noEmail => 'No email';

  @override
  String selectedUserMessage(Object name, Object email) {
    return '$name - $email';
  }
}
