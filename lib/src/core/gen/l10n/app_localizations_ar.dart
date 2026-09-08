// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get english => 'English';

  @override
  String get bangla => 'বাংলা';

  @override
  String get arabic => 'العربية';

  @override
  String get home => 'الرئيسية';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get createNewPassword => 'إنشاء كلمة مرور جديدة';

  @override
  String get createNewPasswordHint =>
      'يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمات المرور المستخدمة سابقاً.';

  @override
  String get resetPassword => 'إعادة تعيين كلمة المرور';

  @override
  String get newPassword => 'كلمة المرور الجديدة';

  @override
  String get passwordChangeSuccess => 'تم تغيير كلمة المرور بنجاح';

  @override
  String get emailRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get isRequired => 'هذا الحقل مطلوب';

  @override
  String get validEmail => 'يرجى إدخال عنوان بريد إلكتروني صحيح';

  @override
  String get enterAssociatedEmail =>
      'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك بريداً إلكترونياً مع تعليمات لإعادة تعيين كلمة المرور.';

  @override
  String minLengthValidation(int min) {
    return 'يجب أن يحتوي هذا الحقل على $min أحرف على الأقل';
  }

  @override
  String maxLengthValidation(int max) {
    return 'يجب أن يحتوي هذا الحقل على $max أحرف كحد أقصى';
  }

  @override
  String get yourPasswordChanged => 'تم تغيير كلمة المرور بنجاح.';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get getStarted => 'ابدأ الآن';

  @override
  String get rememberMe => 'تذكرني';

  @override
  String get forgotPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get backToLogin => 'العودة إلى تسجيل الدخول';

  @override
  String get continueAction => 'متابعة';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get emailAddress => 'عنوان البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get lastName => 'اسم العائلة';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟ ';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل؟ ';

  @override
  String get checkYourMail => 'تحقق من بريدك الإلكتروني';

  @override
  String get enterVerificationCode =>
      'يرجى إدخال الرمز المكون من 4 أرقام المرسل إلى بريدك الإلكتروني hello**@gmail.com.';

  @override
  String get didntGetCode => 'لم تحصل على رمز؟ ';

  @override
  String get clickToResend => 'انقر لإعادة الإرسال';

  @override
  String get didNotReceiveEmail =>
      'لم تستلم البريد الإلكتروني؟ تحقق من مجلد الرسائل غير المرغوب فيها. أو ';

  @override
  String get tryAnotherEmail => 'جرب عنوان بريد إلكتروني آخر';

  @override
  String get learnFlutterTitle => 'تعلم Flutter مع دروس شاملة.';

  @override
  String get learnFlutterSubtitle => 'دليل خطوة بخطوة لبناء تطبيقات Flutter.';

  @override
  String get learnFlutterDescription =>
      'احصل على إشعارات للدروس الجديدة والتحديثات.';

  @override
  String get joinCommunityTitle => 'انضم إلى مجتمع Flutter.';

  @override
  String get joinCommunitySubtitle => 'تواصل مع مطوري Flutter الآخرين.';

  @override
  String get joinCommunityDescription => 'شارك في أحداث المجتمع والمناقشات.';

  @override
  String get buildDeployTitle => 'ابن ونشر تطبيقات Flutter بسهولة.';

  @override
  String get buildDeploySubtitle => 'احصل على أدوات وموارد لتطوير التطبيقات.';

  @override
  String get buildDeployDescription => 'انشر تطبيقاتك على منصات متعددة بسهولة.';

  @override
  String passwordMinLengthValidation(String minLength) {
    return 'يجب أن تحتوي كلمة المرور على $minLength أحرف على الأقل';
  }

  @override
  String get passwordNumberValidation =>
      'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل';

  @override
  String get passwordLowerCaseValidation =>
      'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل';

  @override
  String get passwordUpperCaseValidation =>
      'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل';

  @override
  String get passwordSpecialCharValidation =>
      'يجب أن تحتوي كلمة المرور على رمز خاص واحد على الأقل';

  @override
  String get passwordMismatchValidation => 'كلمات المرور غير متطابقة';

  @override
  String get goHome => 'العودة إلى الصفحة الرئيسية';

  @override
  String noRouteFor(String uri) {
    return 'لا يوجد مسار لـ \'$uri\'';
  }

  @override
  String get failureUnauthenticated =>
      'انتهت صلاحية جلستك. يرجى تسجيل الدخول مرة أخرى.';

  @override
  String get failurePermissionDenied => 'ليس لديك إذن لتنفيذ هذا الإجراء.';

  @override
  String get failureUnreachable =>
      'تعذر الوصول إلى الخادم. يرجى التحقق من اتصالك.';

  @override
  String get failureInvalidInput => 'البيانات المُدخلة غير صالحة.';

  @override
  String get failureNotFound => 'تعذر العثور على المورد المطلوب.';

  @override
  String get failureConflict => 'يتعارض هذا الطلب مع الحالة الحالية.';

  @override
  String get failureCancelled => 'تم إلغاء العملية.';

  @override
  String get failureUnexpected => 'حدث خطأ ما.';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get signInAgain => 'تسجيل الدخول مرة أخرى';

  @override
  String get somethingWentWrong => 'حدث خطأ ما.';

  @override
  String get beta => 'BETA';

  @override
  String get heroHeadlinePrefix => 'الذكاء في ';

  @override
  String get heroHeadlineGradient => 'سرعة التفكير.';

  @override
  String get heroSubtitle =>
      'الاستنتاج والبرمجة والمستندات والصور والصوت — موجهة إلى المحرك المناسب تلقائيًا.';

  @override
  String get intelligenceLayer => 'طبقة الذكاء';

  @override
  String get intelligenceLayerDesc =>
      'توجيه متكيف عبر النماذج الرائدة في الوقت الفعلي';

  @override
  String get zeroDataRetention => 'عدم الاحتفاظ بالبيانات';

  @override
  String get zeroDataRetentionDesc =>
      'خصوصية على مستوى المؤسسات مع عزل الذاكرة المؤقتة';

  @override
  String get activeEnterpriseEngines => 'محركات المؤسسات النشطة';

  @override
  String get welcomeBack => 'مرحبًا بعودتك';

  @override
  String get welcomeBackSubtitle => 'سجل الدخول لمتابعة محادثاتك من حيث توقفت.';

  @override
  String get signInWithGoogle => 'تسجيل الدخول باستخدام Google';

  @override
  String get logInWithSso => 'تسجيل الدخول باستخدام Betopia SSO';

  @override
  String get orSignInWithEmail => 'أو تسجيل الدخول بالبريد الإلكتروني';

  @override
  String get workEmail => 'بريد العمل الإلكتروني';

  @override
  String get workEmailHint => 'name@company.com';

  @override
  String get enterWorkEmailAndPassword =>
      'يرجى إدخال كل من بريد العمل وكلمة المرور';

  @override
  String get signUpFree => 'سجل مجانًا';

  @override
  String helloGreeting(String name) {
    return 'مرحبًا، $name';
  }

  @override
  String get homeSubtitle =>
      'محادثة ذكية، مصممة لأولئك الذين يبنون ما يتخيله الآخرون فقط.';

  @override
  String get whatWillYouCreateToday => 'ماذا ستنشئ اليوم؟';

  @override
  String get addFilesAndPhotos => 'إضافة ملفات وصور';

  @override
  String get knowledgeBase => 'قاعدة المعرفة';

  @override
  String get toolsAndSkills => 'الأدوات والمهارات';

  @override
  String get comingSoon => 'قريبًا';

  @override
  String get deepResearch => 'بحث متعمق';

  @override
  String get fastCreative => 'إبداع سريع';

  @override
  String get codeReasoning => 'برمجة واستنتاج';

  @override
  String get visionMultimodal => 'الرؤية والوسائط المتعددة';

  @override
  String get disclaimerBetopiaAi =>
      'قد يرتكب Betopia AI أخطاء. لا يستخدم Betopia بيانات مساحة العمل الخاصة بك لتدريب نماذجه.';

  @override
  String get signOutConfirmTitle => 'تسجيل الخروج';

  @override
  String get signOutConfirmDescription =>
      'هل أنت متأكد أنك تريد تسجيل الخروج من Betopia AI؟';

  @override
  String get signingOut => 'جارٍ تسجيل الخروج...';

  @override
  String get yesSignOut => 'نعم، تسجيل الخروج';

  @override
  String get cancel => 'إلغاء';

  @override
  String get accountSettings => 'إعدادات الحساب';

  @override
  String get newChat => 'محادثة جديدة';

  @override
  String get today => 'اليوم';

  @override
  String get yesterday => 'أمس';

  @override
  String get previous7Days => 'الأيام السبعة السابقة';

  @override
  String get openSidebar => 'فتح الشريط الجانبي';

  @override
  String get collapseSidebar => 'طي الشريط الجانبي';

  @override
  String processingQuery(String query, String mode) {
    return 'جارٍ المعالجة: \"$query\" باستخدام Betopia AI ($mode)';
  }

  @override
  String loadedConversation(String id) {
    return 'تم تحميل المحادثة #$id';
  }

  @override
  String get chatHistory => 'سجل المحادثات';

  @override
  String get workspace => 'مساحة العمل';

  @override
  String get tools => 'الأدوات';

  @override
  String get connectors => 'الموصلات';

  @override
  String get library => 'المكتبة';

  @override
  String get assetLibrary => 'مكتبة الأصول';

  @override
  String get temporalArchive => 'الأرشيف الزمني';

  @override
  String get standardRole => 'قياسي';

  @override
  String get heroHeadlineSuffix => ' أسرع.';

  @override
  String get featureFrontierModels =>
      '+10 نماذج ذكاء اصطناعي رائدة في محادثة واحدة';

  @override
  String get featureStreaming => 'استجابات فورية ومتدفقة';

  @override
  String get featureEnterpriseSecurity => 'أمان على مستوى المؤسسات';

  @override
  String get footerCopyright => '© 2026 Betopia AI · الشروط · الخصوصية';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get passwordHint => '••••••••';

  @override
  String get slides => 'الشرائح';

  @override
  String get code => 'البرمجة';

  @override
  String get imageGen => 'توليد الصور';

  @override
  String get more => 'المزيد';

  @override
  String get soon => 'قريباً';

  @override
  String get auto => 'تلقائي';

  @override
  String get agent => 'الوكيل';

  @override
  String get commands => 'الأوامر';

  @override
  String get signOut => 'تسجيل الخروج';
}
