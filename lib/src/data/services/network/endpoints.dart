class Endpoints {
  static const base = 'https://backend.betopia.ai';

  static const String login = '/auth/login';
  static const String currentUser = '/auth/me';
  static const String refreshToken = '/api/auth/refresh';

  static const String oidcProviders = '/api/oidc/providers';
  static const String oidcLogin = '/api/oidc/login/{config_id}';
  static const String exchangeTicket = '/api/auth/exchange';

  static const String verifyOtp = '/otp/verify_otp/';
  static const String resendOtp = '/otp/resend_otp/';
}

