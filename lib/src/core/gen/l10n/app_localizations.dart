import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('en'),
  ];

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @bangla.
  ///
  /// In en, this message translates to:
  /// **'বাংলা'**
  String get bangla;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @createNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create New password'**
  String get createNewPassword;

  /// No description provided for @createNewPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Your new password must be different from previous used passwords.'**
  String get createNewPasswordHint;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @passwordChangeSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password Changed Successfully'**
  String get passwordChangeSuccess;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @isRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get isRequired;

  /// No description provided for @validEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid email address'**
  String get validEmail;

  /// No description provided for @enterAssociatedEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter the email associated with your account and we’ll send an email with instructions to reset your password.'**
  String get enterAssociatedEmail;

  /// Error message for minimum length validation
  ///
  /// In en, this message translates to:
  /// **'This field must be at least {min} characters long'**
  String minLengthValidation(int min);

  /// Error message for maximum length validation
  ///
  /// In en, this message translates to:
  /// **'This field must be at most {max} characters long'**
  String maxLengthValidation(int max);

  /// No description provided for @yourPasswordChanged.
  ///
  /// In en, this message translates to:
  /// **'Your password has been changed successfully.'**
  String get yourPasswordChanged;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @backToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to login'**
  String get backToLogin;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAccount;

  /// No description provided for @checkYourMail.
  ///
  /// In en, this message translates to:
  /// **'Check your mail'**
  String get checkYourMail;

  /// No description provided for @enterVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter 4 digit code sent to your mail hello**@gmail.com.'**
  String get enterVerificationCode;

  /// No description provided for @didntGetCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t get a code? '**
  String get didntGetCode;

  /// No description provided for @clickToResend.
  ///
  /// In en, this message translates to:
  /// **'Click to resend'**
  String get clickToResend;

  /// No description provided for @didNotReceiveEmail.
  ///
  /// In en, this message translates to:
  /// **'Did not receive the email? Check your spam filter. or '**
  String get didNotReceiveEmail;

  /// No description provided for @tryAnotherEmail.
  ///
  /// In en, this message translates to:
  /// **'try another email address'**
  String get tryAnotherEmail;

  /// No description provided for @learnFlutterTitle.
  ///
  /// In en, this message translates to:
  /// **'Learn Flutter with comprehensive tutorials.'**
  String get learnFlutterTitle;

  /// No description provided for @learnFlutterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Step-by-step guides for building Flutter apps.'**
  String get learnFlutterSubtitle;

  /// No description provided for @learnFlutterDescription.
  ///
  /// In en, this message translates to:
  /// **'Get notifications for new tutorials and updates.'**
  String get learnFlutterDescription;

  /// No description provided for @joinCommunityTitle.
  ///
  /// In en, this message translates to:
  /// **'Join the Flutter community.'**
  String get joinCommunityTitle;

  /// No description provided for @joinCommunitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Connect with other Flutter developers.'**
  String get joinCommunitySubtitle;

  /// No description provided for @joinCommunityDescription.
  ///
  /// In en, this message translates to:
  /// **'Participate in community events and discussions.'**
  String get joinCommunityDescription;

  /// No description provided for @buildDeployTitle.
  ///
  /// In en, this message translates to:
  /// **'Build and deploy Flutter apps easily.'**
  String get buildDeployTitle;

  /// No description provided for @buildDeploySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Access tools and resources for app development.'**
  String get buildDeploySubtitle;

  /// No description provided for @buildDeployDescription.
  ///
  /// In en, this message translates to:
  /// **'Deploy your apps to multiple platforms with ease.'**
  String get buildDeployDescription;

  /// Error message for password minimum length validation
  ///
  /// In en, this message translates to:
  /// **'Password must be at least {minLength} characters'**
  String passwordMinLengthValidation(String minLength);

  /// No description provided for @passwordNumberValidation.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one number'**
  String get passwordNumberValidation;

  /// No description provided for @passwordLowerCaseValidation.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one lowercase letter'**
  String get passwordLowerCaseValidation;

  /// No description provided for @passwordUpperCaseValidation.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter'**
  String get passwordUpperCaseValidation;

  /// No description provided for @passwordSpecialCharValidation.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one special character'**
  String get passwordSpecialCharValidation;

  /// No description provided for @passwordMismatchValidation.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordMismatchValidation;

  /// No description provided for @goHome.
  ///
  /// In en, this message translates to:
  /// **'Go home'**
  String get goHome;

  /// No description provided for @noRouteFor.
  ///
  /// In en, this message translates to:
  /// **'No route found for \'{uri}\''**
  String noRouteFor(String uri);

  /// No description provided for @failureUnauthenticated.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please sign in again.'**
  String get failureUnauthenticated;

  /// No description provided for @failurePermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to perform this action.'**
  String get failurePermissionDenied;

  /// No description provided for @failureUnreachable.
  ///
  /// In en, this message translates to:
  /// **'Cannot reach the server. Please check your connection.'**
  String get failureUnreachable;

  /// No description provided for @failureInvalidInput.
  ///
  /// In en, this message translates to:
  /// **'The submitted data is invalid.'**
  String get failureInvalidInput;

  /// No description provided for @failureNotFound.
  ///
  /// In en, this message translates to:
  /// **'The requested resource could not be found.'**
  String get failureNotFound;

  /// No description provided for @failureConflict.
  ///
  /// In en, this message translates to:
  /// **'This request conflicts with the current state.'**
  String get failureConflict;

  /// No description provided for @failureCancelled.
  ///
  /// In en, this message translates to:
  /// **'The operation was cancelled.'**
  String get failureCancelled;

  /// No description provided for @failureUnexpected.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get failureUnexpected;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retry;

  /// No description provided for @signInAgain.
  ///
  /// In en, this message translates to:
  /// **'Sign in again'**
  String get signInAgain;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get somethingWentWrong;

  /// No description provided for @beta.
  ///
  /// In en, this message translates to:
  /// **'BETA'**
  String get beta;

  /// No description provided for @heroHeadlinePrefix.
  ///
  /// In en, this message translates to:
  /// **'Intelligence at the '**
  String get heroHeadlinePrefix;

  /// No description provided for @heroHeadlineGradient.
  ///
  /// In en, this message translates to:
  /// **'speed of thought.'**
  String get heroHeadlineGradient;

  /// No description provided for @heroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Reasoning, code, documents, images, and voice — routed to the right engine, automatically.'**
  String get heroSubtitle;

  /// No description provided for @intelligenceLayer.
  ///
  /// In en, this message translates to:
  /// **'Intelligence Layer'**
  String get intelligenceLayer;

  /// No description provided for @intelligenceLayerDesc.
  ///
  /// In en, this message translates to:
  /// **'Adaptive routing across frontier models in real time'**
  String get intelligenceLayerDesc;

  /// No description provided for @zeroDataRetention.
  ///
  /// In en, this message translates to:
  /// **'Zero Data Retention'**
  String get zeroDataRetention;

  /// No description provided for @zeroDataRetentionDesc.
  ///
  /// In en, this message translates to:
  /// **'Enterprise-grade privacy with ephemeral memory isolation'**
  String get zeroDataRetentionDesc;

  /// No description provided for @activeEnterpriseEngines.
  ///
  /// In en, this message translates to:
  /// **'Active Enterprise Engines'**
  String get activeEnterpriseEngines;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBack;

  /// No description provided for @welcomeBackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to pick up your conversations, right where you left off.'**
  String get welcomeBackSubtitle;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// No description provided for @logInWithSso.
  ///
  /// In en, this message translates to:
  /// **'Log in with Betopia SSO'**
  String get logInWithSso;

  /// No description provided for @orSignInWithEmail.
  ///
  /// In en, this message translates to:
  /// **'OR SIGN IN WITH EMAIL'**
  String get orSignInWithEmail;

  /// No description provided for @workEmail.
  ///
  /// In en, this message translates to:
  /// **'Work Email'**
  String get workEmail;

  /// No description provided for @workEmailHint.
  ///
  /// In en, this message translates to:
  /// **'name@company.com'**
  String get workEmailHint;

  /// No description provided for @enterWorkEmailAndPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter both work email and password'**
  String get enterWorkEmailAndPassword;

  /// No description provided for @signUpFree.
  ///
  /// In en, this message translates to:
  /// **'Sign up free'**
  String get signUpFree;

  /// No description provided for @helloGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}'**
  String helloGreeting(String name);

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Intelligent conversation, crafted for those who build what others only imagine.'**
  String get homeSubtitle;

  /// No description provided for @whatWillYouCreateToday.
  ///
  /// In en, this message translates to:
  /// **'What will you create today?'**
  String get whatWillYouCreateToday;

  /// No description provided for @addFilesAndPhotos.
  ///
  /// In en, this message translates to:
  /// **'Add Files & Photos'**
  String get addFilesAndPhotos;

  /// No description provided for @knowledgeBase.
  ///
  /// In en, this message translates to:
  /// **'Knowledge Base'**
  String get knowledgeBase;

  /// No description provided for @toolsAndSkills.
  ///
  /// In en, this message translates to:
  /// **'Tools & Skills'**
  String get toolsAndSkills;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get comingSoon;

  /// No description provided for @deepResearch.
  ///
  /// In en, this message translates to:
  /// **'Deep Research'**
  String get deepResearch;

  /// No description provided for @fastCreative.
  ///
  /// In en, this message translates to:
  /// **'Fast Creative'**
  String get fastCreative;

  /// No description provided for @codeReasoning.
  ///
  /// In en, this message translates to:
  /// **'Code & Reasoning'**
  String get codeReasoning;

  /// No description provided for @visionMultimodal.
  ///
  /// In en, this message translates to:
  /// **'Vision & Multimodal'**
  String get visionMultimodal;

  /// No description provided for @disclaimerBetopiaAi.
  ///
  /// In en, this message translates to:
  /// **'Betopia AI can make mistakes. Betopia doesn\'t use your workspace data to train its models.'**
  String get disclaimerBetopiaAi;

  /// No description provided for @signOutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOutConfirmTitle;

  /// No description provided for @signOutConfirmDescription.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out of Betopia AI?'**
  String get signOutConfirmDescription;

  /// No description provided for @signingOut.
  ///
  /// In en, this message translates to:
  /// **'Signing out...'**
  String get signingOut;

  /// No description provided for @yesSignOut.
  ///
  /// In en, this message translates to:
  /// **'Yes, Sign Out'**
  String get yesSignOut;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accountSettings;

  /// No description provided for @newChat.
  ///
  /// In en, this message translates to:
  /// **'New Chat'**
  String get newChat;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @previous7Days.
  ///
  /// In en, this message translates to:
  /// **'Previous 7 Days'**
  String get previous7Days;

  /// No description provided for @openSidebar.
  ///
  /// In en, this message translates to:
  /// **'Open sidebar'**
  String get openSidebar;

  /// No description provided for @collapseSidebar.
  ///
  /// In en, this message translates to:
  /// **'Collapse sidebar'**
  String get collapseSidebar;

  /// No description provided for @processingQuery.
  ///
  /// In en, this message translates to:
  /// **'Processing: \"{query}\" with Betopia AI ({mode})'**
  String processingQuery(String query, String mode);

  /// No description provided for @loadedConversation.
  ///
  /// In en, this message translates to:
  /// **'Loaded chat conversation #{id}'**
  String loadedConversation(String id);

  /// No description provided for @chatHistory.
  ///
  /// In en, this message translates to:
  /// **'CHAT HISTORY'**
  String get chatHistory;

  /// No description provided for @workspace.
  ///
  /// In en, this message translates to:
  /// **'WORKSPACE'**
  String get workspace;

  /// No description provided for @tools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get tools;

  /// No description provided for @connectors.
  ///
  /// In en, this message translates to:
  /// **'Connectors'**
  String get connectors;

  /// No description provided for @library.
  ///
  /// In en, this message translates to:
  /// **'LIBRARY'**
  String get library;

  /// No description provided for @assetLibrary.
  ///
  /// In en, this message translates to:
  /// **'Asset Library'**
  String get assetLibrary;

  /// No description provided for @temporalArchive.
  ///
  /// In en, this message translates to:
  /// **'Temporal Archive'**
  String get temporalArchive;

  /// No description provided for @standardRole.
  ///
  /// In en, this message translates to:
  /// **'standard'**
  String get standardRole;

  /// No description provided for @heroHeadlineSuffix.
  ///
  /// In en, this message translates to:
  /// **' faster.'**
  String get heroHeadlineSuffix;

  /// No description provided for @featureFrontierModels.
  ///
  /// In en, this message translates to:
  /// **'10+ frontier AI models, one chat'**
  String get featureFrontierModels;

  /// No description provided for @featureStreaming.
  ///
  /// In en, this message translates to:
  /// **'Real-time streaming responses'**
  String get featureStreaming;

  /// No description provided for @featureEnterpriseSecurity.
  ///
  /// In en, this message translates to:
  /// **'Enterprise-grade security'**
  String get featureEnterpriseSecurity;

  /// No description provided for @footerCopyright.
  ///
  /// In en, this message translates to:
  /// **'© 2026 Betopia AI · Terms · Privacy'**
  String get footerCopyright;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'PASSWORD'**
  String get passwordLabel;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'••••••••'**
  String get passwordHint;

  /// No description provided for @slides.
  ///
  /// In en, this message translates to:
  /// **'Slides'**
  String get slides;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

  /// No description provided for @imageGen.
  ///
  /// In en, this message translates to:
  /// **'Image Gen'**
  String get imageGen;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @soon.
  ///
  /// In en, this message translates to:
  /// **'SOON'**
  String get soon;

  /// No description provided for @auto.
  ///
  /// In en, this message translates to:
  /// **'AUTO'**
  String get auto;

  /// No description provided for @agent.
  ///
  /// In en, this message translates to:
  /// **'AGENT'**
  String get agent;

  /// No description provided for @commands.
  ///
  /// In en, this message translates to:
  /// **'commands'**
  String get commands;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @selectSsoProvider.
  ///
  /// In en, this message translates to:
  /// **'Select SSO Provider'**
  String get selectSsoProvider;

  /// No description provided for @ssoLoginTitle.
  ///
  /// In en, this message translates to:
  /// **'Enterprise Single Sign-On'**
  String get ssoLoginTitle;

  /// No description provided for @ssoLoginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select your organization identity provider to continue'**
  String get ssoLoginSubtitle;

  /// No description provided for @noSsoProvidersFound.
  ///
  /// In en, this message translates to:
  /// **'No SSO providers are currently configured.'**
  String get noSsoProvidersFound;

  /// No description provided for @authenticatingWithSso.
  ///
  /// In en, this message translates to:
  /// **'Authenticating with SSO...'**
  String get authenticatingWithSso;

  /// No description provided for @enterAuthTicket.
  ///
  /// In en, this message translates to:
  /// **'Enter Authentication Ticket'**
  String get enterAuthTicket;

  /// No description provided for @enterAuthTicketHint.
  ///
  /// In en, this message translates to:
  /// **'Paste auth ticket from callback'**
  String get enterAuthTicketHint;

  /// No description provided for @exchangeTicket.
  ///
  /// In en, this message translates to:
  /// **'Exchange & Sign In'**
  String get exchangeTicket;

  /// No description provided for @ssoFailed.
  ///
  /// In en, this message translates to:
  /// **'SSO Authentication failed'**
  String get ssoFailed;

  /// No description provided for @signInWithFingerprint.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Biometrics'**
  String get signInWithFingerprint;

  /// No description provided for @biometricPromptReason.
  ///
  /// In en, this message translates to:
  /// **'Authenticate with fingerprint or face to access Betopia AI'**
  String get biometricPromptReason;

  /// No description provided for @biometricsNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Biometric authentication is not available or not enrolled on this device.'**
  String get biometricsNotAvailable;

  /// No description provided for @fingerprintAuthFailed.
  ///
  /// In en, this message translates to:
  /// **'Biometric authentication failed.'**
  String get fingerprintAuthFailed;

  /// No description provided for @biometricsEnabled.
  ///
  /// In en, this message translates to:
  /// **'Biometrics Enabled'**
  String get biometricsEnabled;

  /// No description provided for @authenticatingBiometrics.
  ///
  /// In en, this message translates to:
  /// **'Authenticating with biometrics...'**
  String get authenticatingBiometrics;

  /// No description provided for @ssoBrowserTitle.
  ///
  /// In en, this message translates to:
  /// **'SSO Sign-In'**
  String get ssoBrowserTitle;

  /// No description provided for @authenticatingSso.
  ///
  /// In en, this message translates to:
  /// **'Completing SSO authentication...'**
  String get authenticatingSso;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
