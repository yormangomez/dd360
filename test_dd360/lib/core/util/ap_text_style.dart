// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:test_dd360/core/util/apcolors.dart';

class APTextStyle {
  APTextStyle._();

  static _DisplayLG get displayLG => _DisplayLG();
  static _DisplayMD get displayMD => _DisplayMD();

  static _TextMD get textMD => _TextMD();
  static _TextLG get textLG => _TextLG();
}

class _DisplayLG {
  TextStyle regular = const TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 48,
    color: APColors.secondaryDark,
  );
  TextStyle medium = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 48,
    color: APColors.secondaryDark,
  );
  TextStyle semibold = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 48,
    color: APColors.secondaryDark,
  );
  TextStyle bold = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 48,
    color: APColors.secondaryDark,
  );
}

class _DisplayMD {
  TextStyle regular = const TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 36,
    color: APColors.secondaryDark,
  );
  TextStyle medium = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 36,
    color: APColors.secondaryDark,
  );
  TextStyle semibold = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 36,
    color: APColors.secondaryDark,
  );
  TextStyle bold = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 36,
    color: APColors.secondaryDark,
  );
}

class _TextLG {
  TextStyle regular = const TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 18,
    color: APColors.secondaryDark,
  );
  TextStyle medium = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: APColors.secondaryDark,
  );
  TextStyle semibold = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: APColors.secondaryDark,
  );
  TextStyle bold = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: APColors.secondaryDark,
  );
}

class _TextMD {
  TextStyle regular = const TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 16,
    color: APColors.secondaryDark,
  );
  TextStyle medium = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: APColors.secondaryDark,
  );
  TextStyle semibold = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: APColors.secondaryDark,
  );
  TextStyle bold = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: APColors.secondaryDark,
  );
}
