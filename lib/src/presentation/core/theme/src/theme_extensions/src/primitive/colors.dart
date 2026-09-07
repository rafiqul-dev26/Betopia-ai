part of '../colors.dart';

/// The brand hue.
abstract final class _Brand {
  static const Color s50 = Color(0xFFFFF4ED);
  static const Color s400 = Color(0xFFFF8A3D);
  static const Color s500 = Color(0xFFFF640A);
  static const Color s600 = Color(0xFFE85400);
  static const Color s900 = Color(0xFF381504);
}

/// The gray ramp both modes are built from.
abstract final class _Neutral {
  static const Color s0 = Color(0xFFFFFFFF);
  static const Color s100 = Color(0xFFF3F4F6);
  static const Color s200 = Color(0xFFE5E7EB);
  static const Color s300 = Color(0xFFD1D5DB);
  static const Color s500 = Color(0xFF9CA3AF);
  static const Color s700 = Color(0xFF374151);
  static const Color s800 = Color(0xFF242731);
  static const Color s900 = Color(0xFF16181F);
  static const Color s950 = Color(0xFF0C0D11);
}

/// Success.
abstract final class _Green {
  static const Color s50 = Color(0xFFEBFBEE);
  static const Color s500 = Color(0xFF2F9E44);
  static const Color s900 = Color(0xFF132A1B);
}

/// Warning.
abstract final class _Amber {
  static const Color s50 = Color(0xFFFFF9DB);
  static const Color s500 = Color(0xFFF59F00);
  static const Color s900 = Color(0xFF2E2510);
}

/// Danger.
abstract final class _Red {
  static const Color s50 = Color(0xFFFFF5F5);
  static const Color s500 = Color(0xFFE03131);
  static const Color s900 = Color(0xFF2C1517);
}

/// Information.
abstract final class _Blue {
  static const Color s50 = Color(0xFFE7F5FF);
  static const Color s500 = Color(0xFF1971C2);
  static const Color s900 = Color(0xFF11293C);
}
