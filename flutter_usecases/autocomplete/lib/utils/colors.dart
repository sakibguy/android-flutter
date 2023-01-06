import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AliceColors {
  static const SPLASH_SCREEN_BACKGROUND = const Color(0xFF1F2937);
  static const SEMI_TRANSPARENT = const Color(0x551F2937);
  static const ALICE_GREEN = const Color(0xFF04B25F);
  static const ALICE_GREEN_TEXT = const Color(0xFF038E4C);
  static const ALICE_GREEN_CHECK = const Color(0xFF01C14E);
  static const ALICE_GREY_100 = const Color(0xFFF3F4F6);
  static const CHAT_SENDER = const Color(0xFF04B25F);
  static const ALICE_GREY = const Color(0xFFF3F4F6);
  static const ALICE_BLUE = const Color(0xFF0078CF);
  static const ALICE_BLUE_500 = const Color(0xFF3B82F6);
  static const ALICE_VIBER = const Color(0xFF7360F2);
  static const ALICE_SELECTED_CHANNEL = const Color(0xFFCDF0DF);
  static const ALICE_ORANGE = const Color(0xFFF59E0B);
  static const ALICE_ORANGE_BOT = const Color(0xFFfb7527);
  static const ALICE_ORANGE_LIGHT = const Color(0xFFFFFBEB);
  static const ALICE_ORANGE_100 = const Color(0xFFFFFAEC);
  static const ALICE_ORANGE_900 = const Color(0xFF977A43);
  static const ALICE_GREY_DARK = const Color(0xFF66788A);
  static const ALICE_GREY_300 = const Color(0xFFD1D5DB);
  static const ALICE_GREY_200 = const Color(0xFFD1D5DB);
  static const ALICE_GREY_500 = const Color(0xFF6B7280);
  static const ALICE_GREY_700 = const Color(0xFF374151);
  static const ALICE_GREY_900 = const Color(0xFF111827);
  static const ALICE_GREY_TOOLTIP = const Color(0xFF4B5563);
  static const ALICE_URL_BLUE = const Color(0xFF2563EB);
  static const ALICE_YELLOW_400 = const Color(0xFFFBBF24);
  static const ALICE_GREEN_400 = const Color(0xFF34D399);
  static const ALICE_GREEN_300 = const Color(0xFF6EE7B7);
  static const ALICE_GREEN_100 = const Color(0xFFD1FAE5);
  static const ALICE_GREEN_500 = const Color(0xFF10B981);
  static const ALICE_GREEN_800 = const Color(0xFF065F46);
  static const ALICE_GREY_600 = const Color(0xFF172B4D);
  static const ALICE_GREY_800 = const Color(0xFF1F2937);
  static const ALICE_DIVIDER_GREY = const Color(0xFFE5E7EB);
  static const ALICE_GREY_400 = const Color(0xFF9CA3AF);
  static const ALICE_GREY_50 = const Color(0xFFF9FAFB);
  static const ALICE_TRANSPARENT = const Color(0x009CA3AF);
  static const ALICE_WHITE = const Color(0xFFFFFFFF);
  static const ALICE_RED_500 = const Color(0xFFEF4444);
  static const ALICE_BLUE_100 = const Color(0xFFDBEAFE);
  static const ALICE_BLUE_800 = const Color(0xFF1E40AF);
}

Color platformColor(String name) {
  switch (name) {
    case "whatsapp_messenger":
      return AliceColors.ALICE_GREEN;
    case "facebook_messenger":
      return AliceColors.ALICE_BLUE;
    case "viber_messenger":
      return AliceColors.ALICE_VIBER;
    case "line_messenger":
      return AliceColors.ALICE_GREEN;
    case "facebook_feed":
      return AliceColors.ALICE_BLUE;
    case "telegram_messenger":
      return AliceColors.ALICE_BLUE;
    case "webchat":
      return Colors.redAccent;
    case "instagram_messenger":
      return Colors.redAccent;
    default:
      return AliceColors.ALICE_BLUE;
  }
}
