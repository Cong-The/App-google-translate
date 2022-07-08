import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static TextStyle textStyle = const TextStyle();
}

extension ConfigStyle on TextStyle {
  TextStyle s24() {
    return this.copyWith(fontSize: 24);
  }

  TextStyle s20() {
    return this.copyWith(fontSize: 20);
  }

  TextStyle s16() {
    return this.copyWith(fontSize: 16);
  }

  TextStyle s14() {
    return this.copyWith(fontSize: 14);
  }

  TextStyle s12() {
    return this.copyWith(fontSize: 12);
  }

  TextStyle s10() {
    return this.copyWith(fontSize: 10);
  }

  TextStyle s9() {
    return this.copyWith(fontSize: 9);
  }

  TextStyle s32() {
    return this.copyWith(fontSize: 32);
  }

  TextStyle s42() {
    return this.copyWith(fontSize: 42);
  }

  TextStyle w300() {
    return this.copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle w400() {
    return this.copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle w500() {
    return this.copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle w600() {
    return this.copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle w700() {
    return this.copyWith(fontWeight: FontWeight.w700);
  }

  TextStyle w800() {
    return this.copyWith(fontWeight: FontWeight.w800);
  }

  TextStyle cW0() {
    return this.copyWith(color: ColorsWhite.W0);
  }

  TextStyle cG0() {
    return this.copyWith(color: ColorsGray.G0);
  }

  TextStyle cG1() {
    return this.copyWith(color: ColorsGray.G1);
  }

  TextStyle cG2() {
    return this.copyWith(color: ColorsGray.G2);
  }

  TextStyle cBla1() {
    return this.copyWith(color: ColorsBlack.Bla1);
  }

  TextStyle cBlu0() {
    return this.copyWith(color: ColorsBlue.Blu0);
  }
  // TextStyle cW1() {
  //   return this.copyWith(color: ColorsWhite.W1);
  // }

  // TextStyle cW2() {
  //   return this.copyWith(color: ColorsWhite.W2);
  // }

  // TextStyle cW5() {
  //   return this.copyWith(color: ColorsWhite.W5);
  // }

  // TextStyle cR5() {
  //   return this.copyWith(color: ColorsRed.R5);
  // }

  // TextStyle cN0() {
  //   return this.copyWith(color: ColorsNeutral.N0);
  // }

  // TextStyle cN1() {
  //   return this.copyWith(color: ColorsNeutral.N1);
  // }

  // TextStyle cN2() {
  //   return this.copyWith(color: ColorsNeutral.N2);
  // }

  // TextStyle cN3() {
  //   return this.copyWith(color: ColorsNeutral.N3);
  // }

  // TextStyle cN4() {
  //   return this.copyWith(color: ColorsNeutral.N4);
  // }

  // TextStyle cN5() {
  //   return this.copyWith(color: ColorsNeutral.N5);
  // }

  // TextStyle cG5() {
  //   return this.copyWith(color: ColorsGreen.G5);
  // }

  // TextStyle cP2() {
  //   return this.copyWith(color: ColorsPrimary.P2);
  // }

  // TextStyle cP4() {
  //   return this.copyWith(color: ColorsPrimary.P4);
  // }

  // TextStyle cP5() {
  //   return this.copyWith(color: ColorsPrimary.P5);
  // }

  // TextStyle cY5() {
  //   return this.copyWith(color: ColorsYellow.Y5);
  // }

  // TextStyle cDisable() {
  //   return this.copyWith(color: ColorsSupport.disableText);
  // }

  // TextStyle inActive() {
  //   return this
  //       .copyWith(color: ColorsSupport.resendActivateEmailInDurationColor);
  // }
}
