import 'package:flutter/material.dart';

class CornerRadius {
  const CornerRadius._();

  static const double XS = 4;
  static const double S = 8;
  static const double M = 16;
  static const double L = 24;
  static const double XL = 28;
}

class BorderShape {
  const BorderShape._();

  static const None = RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
  );

  // ignore: non_constant_identifier_names
  static final XS = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(CornerRadius.XS),
  );
  static final S = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(CornerRadius.S),
  );
  static final M = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(CornerRadius.M),
  );
  static final L = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(CornerRadius.L),
  );

  // ignore: non_constant_identifier_names
  static final XL = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(CornerRadius.XL),
  );
  static const Circular = CircleBorder();
}
