// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get english => 'English';

  @override
  String get bangla => 'বাংলা';

  @override
  String get arabic => 'العربية';

  @override
  String get home => 'Home';

  @override
  String get profile => 'Profile';

  @override
  String get login => 'Login';

  @override
  String get createNewPassword => 'Create New password';

  @override
  String get createNewPasswordHint =>
      'Your new password must be different from previous used passwords.';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get passwordChangeSuccess => 'Password Changed Successfully';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get isRequired => 'This field is required';

  @override
  String get validEmail => 'Please enter valid email address';

  @override
  String get enterAssociatedEmail =>
      'Enter the email associated with your account and we’ll send an email with instructions to reset your password.';

  @override
  String minLengthValidation(int min) {
    return 'This field must be at least $min characters long';
  }

  @override
  String maxLengthValidation(int max) {
    return 'This field must be at most $max characters long';
  }

  @override
  String get yourPasswordChanged =>
      'Your password has been changed successfully.';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get logout => 'Logout';

  @override
  String get getStarted => 'Get Started';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get backToLogin => 'Back to login';

  @override
  String get continueAction => 'Continue';

  @override
  String get signUp => 'Sign up';

  @override
  String get signIn => 'Sign In';

  @override
  String get email => 'Email';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get password => 'Password';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get dontHaveAccount => 'Don\'t have an account? ';

  @override
  String get alreadyHaveAccount => 'Already have an account? ';

  @override
  String get checkYourMail => 'Check your mail';

  @override
  String get enterVerificationCode =>
      'Please enter 4 digit code sent to your mail hello**@gmail.com.';

  @override
  String get didntGetCode => 'Didn\'t get a code? ';

  @override
  String get clickToResend => 'Click to resend';

  @override
  String get didNotReceiveEmail =>
      'Did not receive the email? Check your spam filter. or ';

  @override
  String get tryAnotherEmail => 'try another email address';

  @override
  String get learnFlutterTitle => 'Learn Flutter with comprehensive tutorials.';

  @override
  String get learnFlutterSubtitle =>
      'Step-by-step guides for building Flutter apps.';

  @override
  String get learnFlutterDescription =>
      'Get notifications for new tutorials and updates.';

  @override
  String get joinCommunityTitle => 'Join the Flutter community.';

  @override
  String get joinCommunitySubtitle => 'Connect with other Flutter developers.';

  @override
  String get joinCommunityDescription =>
      'Participate in community events and discussions.';

  @override
  String get buildDeployTitle => 'Build and deploy Flutter apps easily.';

  @override
  String get buildDeploySubtitle =>
      'Access tools and resources for app development.';

  @override
  String get buildDeployDescription =>
      'Deploy your apps to multiple platforms with ease.';

  @override
  String passwordMinLengthValidation(String minLength) {
    return 'Password must be at least $minLength characters';
  }

  @override
  String get passwordNumberValidation =>
      'Password must contain at least one number';

  @override
  String get passwordLowerCaseValidation =>
      'Password must contain at least one lowercase letter';

  @override
  String get passwordUpperCaseValidation =>
      'Password must contain at least one uppercase letter';

  @override
  String get passwordSpecialCharValidation =>
      'Password must contain at least one special character';

  @override
  String get passwordMismatchValidation => 'Passwords do not match';

  @override
  String get goHome => 'Go home';

  @override
  String noRouteFor(String uri) {
    return 'No route found for \'$uri\'';
  }

  @override
  String get failureUnauthenticated =>
      'Your session has expired. Please sign in again.';

  @override
  String get failurePermissionDenied =>
      'You do not have permission to perform this action.';

  @override
  String get failureUnreachable =>
      'Cannot reach the server. Please check your connection.';

  @override
  String get failureInvalidInput => 'The submitted data is invalid.';

  @override
  String get failureNotFound => 'The requested resource could not be found.';

  @override
  String get failureConflict =>
      'This request conflicts with the current state.';

  @override
  String get failureCancelled => 'The operation was cancelled.';

  @override
  String get failureUnexpected => 'Something went wrong.';

  @override
  String get retry => 'Try again';

  @override
  String get signInAgain => 'Sign in again';

  @override
  String get somethingWentWrong => 'Something went wrong.';

  @override
  String get beta => 'BETA';

  @override
  String get heroHeadlinePrefix => 'Intelligence at the ';

  @override
  String get heroHeadlineGradient => 'speed of thought.';

  @override
  String get heroSubtitle =>
      'Reasoning, code, documents, images, and voice — routed to the right engine, automatically.';

  @override
  String get intelligenceLayer => 'Intelligence Layer';

  @override
  String get intelligenceLayerDesc =>
      'Adaptive routing across frontier models in real time';

  @override
  String get zeroDataRetention => 'Zero Data Retention';

  @override
  String get zeroDataRetentionDesc =>
      'Enterprise-grade privacy with ephemeral memory isolation';

  @override
  String get activeEnterpriseEngines => 'Active Enterprise Engines';

  @override
  String get welcomeBack => 'Welcome back';

  @override
  String get welcomeBackSubtitle =>
      'Sign in to pick up your conversations, right where you left off.';

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get logInWithSso => 'Log in with Betopia SSO';

  @override
  String get orSignInWithEmail => 'OR SIGN IN WITH EMAIL';

  @override
  String get workEmail => 'Work Email';

  @override
  String get workEmailHint => 'name@company.com';

  @override
  String get enterWorkEmailAndPassword =>
      'Please enter both work email and password';

  @override
  String get signUpFree => 'Sign up free';

  @override
  String helloGreeting(String name) {
    return 'Hello, $name';
  }

  @override
  String get homeSubtitle =>
      'Intelligent conversation, crafted for those who build what others only imagine.';

  @override
  String get whatWillYouCreateToday => 'What will you create today?';

  @override
  String get addFilesAndPhotos => 'Add Files & Photos';

  @override
  String get knowledgeBase => 'Knowledge Base';

  @override
  String get toolsAndSkills => 'Tools & Skills';

  @override
  String get comingSoon => 'Coming Soon';

  @override
  String get deepResearch => 'Deep Research';

  @override
  String get fastCreative => 'Fast Creative';

  @override
  String get codeReasoning => 'Code & Reasoning';

  @override
  String get visionMultimodal => 'Vision & Multimodal';

  @override
  String get disclaimerBetopiaAi =>
      'Betopia AI can make mistakes. Betopia doesn\'t use your workspace data to train its models.';

  @override
  String get signOutConfirmTitle => 'Sign Out';

  @override
  String get signOutConfirmDescription =>
      'Are you sure you want to sign out of Betopia AI?';

  @override
  String get signingOut => 'Signing out...';

  @override
  String get yesSignOut => 'Yes, Sign Out';

  @override
  String get cancel => 'Cancel';

  @override
  String get accountSettings => 'Account Settings';

  @override
  String get newChat => 'New Chat';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get previous7Days => 'Previous 7 Days';

  @override
  String get openSidebar => 'Open sidebar';

  @override
  String get collapseSidebar => 'Collapse sidebar';

  @override
  String processingQuery(String query, String mode) {
    return 'Processing: \"$query\" with Betopia AI ($mode)';
  }

  @override
  String loadedConversation(String id) {
    return 'Loaded chat conversation #$id';
  }

  @override
  String get chatHistory => 'CHAT HISTORY';

  @override
  String get workspace => 'WORKSPACE';

  @override
  String get tools => 'Tools';

  @override
  String get connectors => 'Connectors';

  @override
  String get library => 'LIBRARY';

  @override
  String get assetLibrary => 'Asset Library';

  @override
  String get temporalArchive => 'Temporal Archive';

  @override
  String get standardRole => 'standard';

  @override
  String get heroHeadlineSuffix => ' faster.';

  @override
  String get featureFrontierModels => '10+ frontier AI models, one chat';

  @override
  String get featureStreaming => 'Real-time streaming responses';

  @override
  String get featureEnterpriseSecurity => 'Enterprise-grade security';

  @override
  String get footerCopyright => '© 2026 Betopia AI · Terms · Privacy';

  @override
  String get passwordLabel => 'PASSWORD';

  @override
  String get passwordHint => '••••••••';

  @override
  String get slides => 'Slides';

  @override
  String get code => 'Code';

  @override
  String get imageGen => 'Image Gen';

  @override
  String get more => 'More';

  @override
  String get soon => 'SOON';

  @override
  String get auto => 'AUTO';

  @override
  String get agent => 'AGENT';

  @override
  String get commands => 'commands';

  @override
  String get signOut => 'Sign Out';

  @override
  String get selectSsoProvider => 'Select SSO Provider';

  @override
  String get ssoLoginTitle => 'Enterprise Single Sign-On';

  @override
  String get ssoLoginSubtitle =>
      'Select your organization identity provider to continue';

  @override
  String get noSsoProvidersFound =>
      'No SSO providers are currently configured.';

  @override
  String get authenticatingWithSso => 'Authenticating with SSO...';

  @override
  String get enterAuthTicket => 'Enter Authentication Ticket';

  @override
  String get enterAuthTicketHint => 'Paste auth ticket from callback';

  @override
  String get exchangeTicket => 'Exchange & Sign In';

  @override
  String get ssoFailed => 'SSO Authentication failed';

  @override
  String get signInWithFingerprint => 'Sign in with Biometrics';

  @override
  String get biometricPromptReason =>
      'Authenticate with fingerprint or face to access Betopia AI';

  @override
  String get biometricsNotAvailable =>
      'Biometric authentication is not available or not enrolled on this device.';

  @override
  String get fingerprintAuthFailed => 'Biometric authentication failed.';

  @override
  String get biometricsEnabled => 'Biometrics Enabled';

  @override
  String get authenticatingBiometrics => 'Authenticating with biometrics...';

  @override
  String get ssoBrowserTitle => 'SSO Sign-In';

  @override
  String get authenticatingSso => 'Completing SSO authentication...';
}
