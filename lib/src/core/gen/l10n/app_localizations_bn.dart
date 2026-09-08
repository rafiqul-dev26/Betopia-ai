// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get english => 'English';

  @override
  String get bangla => 'বাংলা';

  @override
  String get arabic => 'العربية';

  @override
  String get home => 'হোম';

  @override
  String get profile => 'প্রোফাইল';

  @override
  String get login => 'লগইন';

  @override
  String get createNewPassword => 'নতুন পাসওয়ার্ড তৈরি করুন';

  @override
  String get createNewPasswordHint =>
      'আপনার নতুন পাসওয়ার্ড আগে ব্যবহৃত পাসওয়ার্ড থেকে আলাদা হতে হবে।';

  @override
  String get resetPassword => 'পাসওয়ার্ড রিসেট করুন';

  @override
  String get newPassword => 'নতুন পাসওয়ার্ড';

  @override
  String get passwordChangeSuccess => 'পাসওয়ার্ড সফলভাবে পরিবর্তন করা হয়েছে';

  @override
  String get emailRequired => 'ইমেইল প্রয়োজন';

  @override
  String get passwordRequired => 'পাসওয়ার্ড প্রয়োজন';

  @override
  String get isRequired => 'এই ক্ষেত্রটি প্রয়োজন';

  @override
  String get validEmail => 'অনুগ্রহ করে একটি বৈধ ইমেইল ঠিকানা দিন';

  @override
  String get enterAssociatedEmail =>
      'আপনার অ্যাকাউন্টের সাথে যুক্ত ইমেইল দিন এবং আমরা আপনার পাসওয়ার্ড রিসেট করার নির্দেশনা সহ একটি ইমেইল পাঠাব।';

  @override
  String minLengthValidation(int min) {
    return 'এই ক্ষেত্রটি কমপক্ষে $min অক্ষর দীর্ঘ হতে হবে';
  }

  @override
  String maxLengthValidation(int max) {
    return 'এই ক্ষেত্রটি সর্বাধিক $max অক্ষর দীর্ঘ হতে হবে';
  }

  @override
  String get yourPasswordChanged =>
      'আপনার পাসওয়ার্ড সফলভাবে পরিবর্তন করা হয়েছে।';

  @override
  String get confirmPassword => 'পাসওয়ার্ড নিশ্চিত করুন';

  @override
  String get logout => 'লগআউট';

  @override
  String get getStarted => 'শুরু করুন';

  @override
  String get rememberMe => 'আমাকে মনে রাখুন';

  @override
  String get forgotPassword => 'পাসওয়ার্ড ভুলে গেছেন?';

  @override
  String get backToLogin => 'লগইনে ফিরে যান';

  @override
  String get continueAction => 'চালিয়ে যান';

  @override
  String get signUp => 'সাইন আপ';

  @override
  String get signIn => 'সাইন ইন';

  @override
  String get email => 'ইমেইল';

  @override
  String get emailAddress => 'ইমেইল ঠিকানা';

  @override
  String get password => 'পাসওয়ার্ড';

  @override
  String get firstName => 'প্রথম নাম';

  @override
  String get lastName => 'শেষ নাম';

  @override
  String get dontHaveAccount => 'অ্যাকাউন্ট নেই? ';

  @override
  String get alreadyHaveAccount => 'ইতিমধ্যে অ্যাকাউন্ট আছে? ';

  @override
  String get checkYourMail => 'আপনার মেইল চেক করুন';

  @override
  String get enterVerificationCode =>
      'অনুগ্রহ করে আপনার মেইলে পাঠানো 4 অঙ্কের কোড দিন hello**@gmail.com।';

  @override
  String get didntGetCode => 'কোড পাননি? ';

  @override
  String get clickToResend => 'পুনরায় পাঠাতে ক্লিক করুন';

  @override
  String get didNotReceiveEmail =>
      'ইমেইল পাননি? আপনার স্প্যাম ফিল্টার চেক করুন। অথবা ';

  @override
  String get tryAnotherEmail => 'অন্য ইমেইল ঠিকানা চেষ্টা করুন';

  @override
  String get learnFlutterTitle => 'ব্যাপক টিউটোরিয়াল সহ Flutter শিখুন।';

  @override
  String get learnFlutterSubtitle =>
      'Flutter অ্যাপ তৈরি করার জন্য ধাপে ধাপে গাইড।';

  @override
  String get learnFlutterDescription =>
      'নতুন টিউটোরিয়াল এবং আপডেটের জন্য বিজ্ঞপ্তি পান।';

  @override
  String get joinCommunityTitle => 'Flutter সম্প্রদায়ে যোগ দিন।';

  @override
  String get joinCommunitySubtitle =>
      'অন্যান্য Flutter ডেভেলপারদের সাথে সংযুক্ত হন।';

  @override
  String get joinCommunityDescription =>
      'সম্প্রদায়ের ইভেন্ট এবং আলোচনায় অংশগ্রহণ করুন।';

  @override
  String get buildDeployTitle => 'সহজে Flutter অ্যাপ তৈরি এবং ডেপ্লয় করুন।';

  @override
  String get buildDeploySubtitle =>
      'অ্যাপ ডেভেলপমেন্টের জন্য টুল এবং সম্পদ অ্যাক্সেস করুন।';

  @override
  String get buildDeployDescription =>
      'সহজে একাধিক প্ল্যাটফর্মে আপনার অ্যাপ ডেপ্লয় করুন।';

  @override
  String passwordMinLengthValidation(String minLength) {
    return 'পাসওয়ার্ড কমপক্ষে $minLength অক্ষর দীর্ঘ হতে হবে';
  }

  @override
  String get passwordNumberValidation =>
      'পাসওয়ার্ডে কমপক্ষে একটি সংখ্যা থাকতে হবে';

  @override
  String get passwordLowerCaseValidation =>
      'পাসওয়ার্ডে কমপক্ষে একটি ছোট হাতের অক্ষর থাকতে হবে';

  @override
  String get passwordUpperCaseValidation =>
      'পাসওয়ার্ডে কমপক্ষে একটি বড় হাতের অক্ষর থাকতে হবে';

  @override
  String get passwordSpecialCharValidation =>
      'পাসওয়ার্ডে কমপক্ষে একটি বিশেষ অক্ষর থাকতে হবে';

  @override
  String get passwordMismatchValidation => 'পাসওয়ার্ড মিলছে না';

  @override
  String get goHome => 'হোমে ফিরে যান';

  @override
  String noRouteFor(String uri) {
    return '\'$uri\' এর জন্য কোনো রুট পাওয়া যায়নি';
  }

  @override
  String get failureUnauthenticated =>
      'আপনার সেশনের মেয়াদ শেষ হয়েছে। অনুগ্রহ করে আবার সাইন ইন করুন।';

  @override
  String get failurePermissionDenied => 'এই কাজটি করার অনুমতি আপনার নেই।';

  @override
  String get failureUnreachable =>
      'সার্ভারে পৌঁছানো যাচ্ছে না। অনুগ্রহ করে আপনার সংযোগ পরীক্ষা করুন।';

  @override
  String get failureInvalidInput => 'প্রদত্ত তথ্য সঠিক নয়।';

  @override
  String get failureNotFound => 'অনুরোধকৃত রিসোর্স খুঁজে পাওয়া যায়নি।';

  @override
  String get failureConflict => 'এই অনুরোধটি বর্তমান অবস্থার সাথে সাংঘর্ষিক।';

  @override
  String get failureCancelled => 'কাজটি বাতিল করা হয়েছে।';

  @override
  String get failureUnexpected => 'কিছু একটা ভুল হয়েছে।';

  @override
  String get retry => 'আবার চেষ্টা করুন';

  @override
  String get signInAgain => 'আবার সাইন ইন করুন';

  @override
  String get somethingWentWrong => 'কিছু একটা ভুল হয়েছে।';

  @override
  String get beta => 'BETA';

  @override
  String get heroHeadlinePrefix => 'ইন্টেলিজেন্সের ';

  @override
  String get heroHeadlineGradient => 'চিন্তার গতি।';

  @override
  String get heroSubtitle =>
      'যুক্তি, কোড, ডকুমেন্টস, ছবি এবং ভয়েস — সঠিক ইঞ্জিনে স্বয়ংক্রিয়ভাবে পরিচালিত।';

  @override
  String get intelligenceLayer => 'ইন্টেলিজেন্স লেয়ার';

  @override
  String get intelligenceLayerDesc =>
      'রিয়েল টাইমে ফ্রন্টিয়ার মডেলগুলির মধ্যে অভিযোজিত রাউটিং';

  @override
  String get zeroDataRetention => 'জিরো ডেটা রিটেনশন';

  @override
  String get zeroDataRetentionDesc =>
      'ক্ষণস্থায়ী মেমরি বিচ্ছিন্নতা সহ এন্টারপ্রাইজ-গ্রেড গোপনীয়তা';

  @override
  String get activeEnterpriseEngines => 'সক্রিয় এন্টারপ্রাইজ ইঞ্জিন';

  @override
  String get welcomeBack => 'স্বাগতম';

  @override
  String get welcomeBackSubtitle =>
      'আপনার কথোপকথন শুরু করতে সাইন ইন করুন, যেখানে আপনি ছেড়েছিলেন।';

  @override
  String get signInWithGoogle => 'Google দিয়ে সাইন ইন করুন';

  @override
  String get logInWithSso => 'Betopia SSO দিয়ে লগ ইন করুন';

  @override
  String get orSignInWithEmail => 'অথবা ইমেইল দিয়ে সাইন ইন করুন';

  @override
  String get workEmail => 'কাজের ইমেইল';

  @override
  String get workEmailHint => 'name@company.com';

  @override
  String get enterWorkEmailAndPassword =>
      'অনুগ্রহ করে কাজের ইমেইল এবং পাসওয়ার্ড দুটিই লিখুন';

  @override
  String get signUpFree => 'বিনামূল্যে সাইন আপ করুন';

  @override
  String helloGreeting(String name) {
    return 'হ্যালো, $name';
  }

  @override
  String get homeSubtitle =>
      'বুদ্ধিমান কথোপকথন, তাদের জন্য তৈরি যারা অন্যরা কেবল কল্পনা করে তা তৈরি করে।';

  @override
  String get whatWillYouCreateToday => 'আজ আপনি কি তৈরি করবেন?';

  @override
  String get addFilesAndPhotos => 'ফাইল ও ছবি যোগ করুন';

  @override
  String get knowledgeBase => 'নলেজ বেস';

  @override
  String get toolsAndSkills => 'টুলস ও স্কিলস';

  @override
  String get comingSoon => 'শীঘ্রই আসছে';

  @override
  String get deepResearch => 'ডিপ রিসার্চ';

  @override
  String get fastCreative => 'ফাস্ট ক্রিয়েটিভ';

  @override
  String get codeReasoning => 'কোড ও যুক্তি';

  @override
  String get visionMultimodal => 'ভিশন ও মাল্টিমোডাল';

  @override
  String get disclaimerBetopiaAi =>
      'Betopia AI ভুল করতে পারে। Betopia আপনার ওয়ার্কস্পেস ডেটা মডেল প্রশিক্ষণের জন্য ব্যবহার করে না।';

  @override
  String get signOutConfirmTitle => 'সাইন আউট';

  @override
  String get signOutConfirmDescription =>
      'আপনি কি নিশ্চিত যে আপনি Betopia AI থেকে সাইন আউট করতে চান?';

  @override
  String get signingOut => 'সাইন আউট হচ্ছে...';

  @override
  String get yesSignOut => 'হ্যাঁ, সাইন আউট করুন';

  @override
  String get cancel => 'বাতিল';

  @override
  String get accountSettings => 'অ্যাকাউন্ট সেটিংস';

  @override
  String get newChat => 'নতুন চ্যাট';

  @override
  String get today => 'আজ';

  @override
  String get yesterday => 'গতকাল';

  @override
  String get previous7Days => 'গত ৭ দিন';

  @override
  String get openSidebar => 'সাইডবার খুলুন';

  @override
  String get collapseSidebar => 'সাইডবার বন্ধ করুন';

  @override
  String processingQuery(String query, String mode) {
    return 'প্রসেসিং: \"$query\" Betopia AI এর সাথে ($mode)';
  }

  @override
  String loadedConversation(String id) {
    return 'চ্যাট কথোপকথন লোড হয়েছে #$id';
  }

  @override
  String get chatHistory => 'চ্যাট ইতিহাস';

  @override
  String get workspace => 'ওয়ার্কস্পেস';

  @override
  String get tools => 'টুলস';

  @override
  String get connectors => 'কানেক্টরস';

  @override
  String get library => 'লাইব্রেরি';

  @override
  String get assetLibrary => 'অ্যাসেট লাইব্রেরি';

  @override
  String get temporalArchive => 'টেম্পোরাল আর্কাইভ';

  @override
  String get standardRole => 'স্ট্যান্ডার্ড';

  @override
  String get heroHeadlineSuffix => ' দ্রুততর।';

  @override
  String get featureFrontierModels => '১০+ ফ্রন্টিয়ার এআই মডেল, এক চ্যাটে';

  @override
  String get featureStreaming => 'রিয়েল-টাইম স্ট্রিমিং রেসপন্স';

  @override
  String get featureEnterpriseSecurity => 'এন্টারপ্রাইজ-গ্রেড নিরাপত্তা';

  @override
  String get footerCopyright => '© ২০২৬ Betopia AI · শর্তাবলী · গোপনীয়তা';

  @override
  String get passwordLabel => 'পাসওয়ার্ড';

  @override
  String get passwordHint => '••••••••';

  @override
  String get slides => 'স্লাইডস';

  @override
  String get code => 'কোড';

  @override
  String get imageGen => 'ছবি তৈরি';

  @override
  String get more => 'আরও';

  @override
  String get soon => 'শীঘ্রই';

  @override
  String get auto => 'অটো';

  @override
  String get agent => 'এজেন্ট';

  @override
  String get commands => 'কমান্ড';

  @override
  String get signOut => 'সাইন আউট';

  @override
  String get selectSsoProvider => 'এসএসও প্রোভাইডার নির্বাচন করুন';

  @override
  String get ssoLoginTitle => 'এন্টারপ্রাইজ সিঙ্গেল সাইন-অন';

  @override
  String get ssoLoginSubtitle =>
      'চালিয়ে যেতে আপনার প্রতিষ্ঠানের আইডেন্টিটি প্রোভাইডার নির্বাচন করুন';

  @override
  String get noSsoProvidersFound =>
      'বর্তমানে কোনো এসএসও প্রোভাইডার কনফিগার করা নেই।';

  @override
  String get authenticatingWithSso => 'এসএসও দিয়ে প্রমাণীকরণ হচ্ছে...';

  @override
  String get enterAuthTicket => 'প্রমাণীকরণ টিকিট দিন';

  @override
  String get enterAuthTicketHint => 'কলব্যাক থেকে অথ টিকিট পেস্ট করুন';

  @override
  String get exchangeTicket => 'বিনিময় এবং সাইন ইন করুন';

  @override
  String get ssoFailed => 'এসএসও প্রমাণীকরণ ব্যর্থ হয়েছে';

  @override
  String get signInWithFingerprint => 'বায়োমেট্রিক দিয়ে সাইন ইন করুন';

  @override
  String get biometricPromptReason =>
      'Betopia AI অ্যাক্সেস করতে আঙুলের ছাপ বা মুখ দিয়ে প্রমাণীকরণ করুন';

  @override
  String get biometricsNotAvailable =>
      'এই ডিভাইসে বায়োমেট্রিক প্রমাণীকরণ উপলব্ধ বা নিবন্ধিত নেই।';

  @override
  String get fingerprintAuthFailed => 'বায়োমেট্রিক প্রমাণীকরণ ব্যর্থ হয়েছে।';

  @override
  String get biometricsEnabled => 'বায়োমেট্রিক সক্রিয়';

  @override
  String get authenticatingBiometrics =>
      'বায়োমেট্রিক দিয়ে প্রমাণীকরণ হচ্ছে...';

  @override
  String get ssoBrowserTitle => 'এসএসও সাইন-ইন';

  @override
  String get authenticatingSso => 'এসএসও প্রমাণীকরণ সম্পন্ন হচ্ছে...';
}
