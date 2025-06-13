// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get strollBonfireTitle => 'Stroll Bonfire';

  @override
  String timeRemaining(String time, String minutes) {
    return '${time}h ${minutes}m';
  }

  @override
  String participantCount(String count) {
    return '$count';
  }

  @override
  String profileNameAge(String name, String age) {
    return '$name, $age';
  }

  @override
  String get favoriteTimeQuestion => 'What is your favorite time of the day?';

  @override
  String get profileQuote => '“Mine is definitely the peace in the morning.”';

  @override
  String get optionA => 'The peace in the early mornings';

  @override
  String get optionB => 'The magical golden hours';

  @override
  String get optionC => 'Wind-down time after dinners';

  @override
  String get optionD => 'The serenity past midnight';

  @override
  String get pickOptionPrompt => 'Pick your option.\nSee who has a similar mind.';
}
