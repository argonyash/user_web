import 'package:flutter/material.dart';

class MySize {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? safeWidth;
  static double? safeHeight;

  static late double scaleFactorWidth;
  static late double scaleFactorHeight;
  static double? size282;

  //Custom sizes
  static double? size0;
  static double? size1;
  static late double? size2;
  static late double? size3;
  static double? size4;
  static double? size5;
  static double? size6;
  static double? size7;
  static double? size8;
  static double? size10;
  static double? size79;

  static double? size11;
  static double? size12;
  static double? size14;
  static double? size16;
  static double? size18;
  static double? size20;
  static double? size22;
  static double? size24;
  static double? size26;
  static double? size28;
  static double? size30;
  static double? size32;
  static double? size34;
  static double? size36;
  static double? size38;
  static double? size40;
  static double? size42;
  static double? size44;
  static double? size21;
  static double? size23;

  static double? size25;
  static double? size19;

  static double? size29;
  static double? size33;
  static double? size31;
  static double? size39;
  static double? size63;

  static double? size45;
  static double? size48;
  static double? size50;
  static double? size52;
  static double? size54;
  static double? size56;
  static double? size60;
  static double? size62;
  static double? size64;
  static double? size68;
  static double? size71;
  static double? size72;
  static double? size76;
  static double? size77;
  static double? size80;
  static double? size81;
  static double? size90;
  static double? size96;
  static double? size100;
  static double? size93;
  static double? size103;
  static double? size120;
  static double? size136;
  static double? size121;
  static double? size122;
  static double? size131;
  static double? size140;
  static double? size160;
  static double? size180;
  static double? size330;
  static double? size300;
  static double? size293;

  static double? size315;
  static double? size55;

  static double? size84;
  static double? size35;
  static double? size88;

  static double? size13;
  static double? size74;
  static double? size146;
  static double? size1081;
  static double? size135;
  static double? size115;
  static double? size255;
  static double? size258;
  static double? size500;

  static double? size268;
  static double? size176;
  static double? size86;
  static double? size470;

  static double? size17;
  static double? size200;
  static double? size240;
  static double? size243;
  static double? size290;
  static double? size253;
  static double? size303;
  static double? size316;
  static double? size127;
  static double? size137;
  static double? size285;
  static double? size287;

  static double? size70;
  static double? size148;
  static double? size266;
  static double? size150;

  static double? size320;

  static double? size112;

  static double? size15;

  static double? size9;

  static double? size94;

  static double? size270;

  static double? size232;

  static double? size317;
  static double? size46;
  static double? size47;
  static double? size49;
  static double? size37;
  static double? size147;
  static double? size43;
  static double? size65;
  static double? size102;

  static double? size126;
  static double? size123;
  static double? size129;

  static double? size155;
  static double? size158;
  static double? size188;
  static double? size220;
  static double? size225;
  static double? size296;

  static double? size164;
  static double? size327;
  static double? size370;
  static double? size410;
  static double? size212;
  static double? size254;
  static double? size118;
  static double? size156;
  static double? size58;
  static double? size162;
  static double? size167;
  static double? size168;
  static double? size178;
  static double? size41;
  static double? size421;
  static double? size172;
  static double? size730;
  static double? size174;
  static double? size400;
  static double? size186;
  static double? size237;

  static double? size104;
  static double? size75;
  static double? size144;
  static double? size360;
  static double? size397;
  static double? size98;

  static double? size294;
  static double? size295;
  static double? size230;
  static double? size304;
  static double? size110;
  static double? size69;
  static double? size368;
  static double? size325;
  static double? size242;

  static double? size218;

  static double? size27;
  static double? size151;
  static double? size350;
  static double? size82;
  static double? size326;
  static double? size404;
  static double? size437;
  static double? size89;
  static double? size101;
  static double? size280;
  static double? size249;
  static double? size480;
  static double? size420;
  static double? size175;
  static double? size351;
  static double? size419;
  static double? size205;
  static double? size278;
  static double? size553;
  static double? size224;
  static double? size250;
  static double? size128;
  static double? size182;

  static double? size117;
  static double? size66;
  static double? size53;
  static double? size108;
  static double? size73;
  static double? size187;
  static double? size170;
  static double? size216;

  static double? size318;
  static double? size142;
  static double? size310;
  static double? size153;
  static double? size83;
  static double? size87;
  static double? size221;
  static double? size550;
  static double? size319;
  static double? size455;
  static double? size335;
  static double? size358;
  static double? size105;
  static double? size85;
  static double? size95;
  static double? size125;
  static double? size248;

  static double? size210;

  static double? size198;
  static double? size340;
  static double? size447;
  static double? size600;
  static double? size690;
  static double? size635;

  static double? size215;
  static double? size560;

  static double? size207;

  static double? size208;
  static double? size191;
  static double? size78;
  static double? size405;
  static double? size425;
  static double? size582;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    double _safeAreaWidth =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    double _safeAreaHeight =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeWidth = (screenWidth - _safeAreaWidth);
    safeHeight = (screenHeight - _safeAreaHeight);

    safeWidth = (screenWidth - _safeAreaWidth);
    safeHeight = (screenHeight - _safeAreaHeight);

    scaleFactorHeight = (safeHeight! / MediaQuery.of(context).size.height);
    if (scaleFactorHeight < 1) {
      double diff = (1 - scaleFactorHeight) * (1 - scaleFactorHeight);
      scaleFactorHeight += diff;
    }

    scaleFactorWidth = (safeWidth! / MediaQuery.of(context).size.width);

    if (scaleFactorWidth < 1) {
      double diff = (1 - scaleFactorWidth) * (1 - scaleFactorWidth);
      scaleFactorWidth += diff;
    }

    //Custom sizes
    size0 = 0;
    size1 = scaleFactorHeight * 1;
    size2 = scaleFactorHeight * 2;
    size3 = scaleFactorHeight * 3;
    size4 = scaleFactorHeight * 4;
    size5 = scaleFactorHeight * 5;
    size6 = scaleFactorHeight * 6;
    size7 = scaleFactorHeight * 7;
    size8 = scaleFactorHeight * 8;
    size10 = scaleFactorHeight * 10;
    size11 = scaleFactorHeight * 11;
    size12 = scaleFactorHeight * 12;
    size14 = scaleFactorHeight * 14;
    size16 = scaleFactorHeight * 16;
    size18 = scaleFactorHeight * 18;
    size20 = scaleFactorHeight * 20;
    size24 = scaleFactorHeight * 24;
    size19 = scaleFactorHeight * 19;
    size20 = scaleFactorHeight * 20;
    size22 = scaleFactorHeight * 22;
    size24 = scaleFactorHeight * 24;
    size25 = scaleFactorHeight * 25;
    size26 = scaleFactorHeight * 26;
    size28 = scaleFactorHeight * 28;
    size30 = scaleFactorHeight * 30;
    size32 = scaleFactorHeight * 32;
    size34 = scaleFactorHeight * 34;
    size31 = scaleFactorHeight * 31;

    size33 = scaleFactorHeight * 33;
    size35 = scaleFactorHeight * 35;
    size36 = scaleFactorHeight * 36;
    size38 = scaleFactorHeight * 38;
    size40 = scaleFactorHeight * 40;
    size42 = scaleFactorHeight * 42;
    size44 = scaleFactorHeight * 44;
    size45 = scaleFactorHeight * 45;
    size48 = scaleFactorHeight * 48;
    size50 = scaleFactorHeight * 50;
    size52 = scaleFactorHeight * 52;
    size54 = scaleFactorHeight * 54;
    size31 = scaleFactorHeight * 31;

    size32 = scaleFactorHeight * 32;
    size33 = scaleFactorHeight * 33;
    size34 = scaleFactorHeight * 34;
    size36 = scaleFactorHeight * 36;
    size38 = scaleFactorHeight * 38;
    size39 = scaleFactorHeight * 39;
    size40 = scaleFactorHeight * 40;
    size42 = scaleFactorHeight * 42;
    size44 = scaleFactorHeight * 44;
    size48 = scaleFactorHeight * 48;
    size47 = scaleFactorHeight * 47;
    size46 = scaleFactorHeight * 46;
    size45 = scaleFactorHeight * 45;

    size48 = scaleFactorHeight * 48;
    size49 = scaleFactorHeight * 49;
    size35 = scaleFactorHeight * 35;
    size36 = scaleFactorHeight * 36;
    size38 = scaleFactorHeight * 38;
    size39 = scaleFactorHeight * 39;
    size32 = scaleFactorHeight * 32;
    size33 = scaleFactorHeight * 33;
    size34 = scaleFactorHeight * 34;
    size36 = scaleFactorHeight * 36;
    size38 = scaleFactorHeight * 38;
    size39 = scaleFactorHeight * 39;
    size40 = scaleFactorHeight * 40;
    size42 = scaleFactorHeight * 42;
    size44 = scaleFactorHeight * 44;
    size48 = scaleFactorHeight * 48;
    size47 = scaleFactorHeight * 47;
    size46 = scaleFactorHeight * 46;
    size45 = scaleFactorHeight * 45;

    size48 = scaleFactorHeight * 48;
    size49 = scaleFactorHeight * 49;
    size35 = scaleFactorHeight * 35;
    size36 = scaleFactorHeight * 36;
    size38 = scaleFactorHeight * 38;
    size39 = scaleFactorHeight * 39;

    size40 = scaleFactorHeight * 40;
    size42 = scaleFactorHeight * 42;
    size43 = scaleFactorHeight * 43;
    size44 = scaleFactorHeight * 44;
    size45 = scaleFactorHeight * 45;

    size46 = scaleFactorHeight * 46;
    size48 = scaleFactorHeight * 48;
    size49 = scaleFactorHeight * 49;

    size50 = scaleFactorHeight * 50;
    size52 = scaleFactorHeight * 52;
    size54 = scaleFactorHeight * 54;
    size55 = scaleFactorHeight * 55;
    size56 = scaleFactorHeight * 56;
    size60 = scaleFactorHeight * 60;
    size62 = scaleFactorHeight * 62;
    size64 = scaleFactorHeight * 64;
    size68 = scaleFactorHeight * 68;
    size72 = scaleFactorHeight * 72;
    size76 = scaleFactorHeight * 76;
    size80 = scaleFactorHeight * 80;
    size88 = scaleFactorHeight * 88;
    size90 = scaleFactorHeight * 90;
    size96 = scaleFactorHeight * 96;
    size100 = scaleFactorHeight * 100;
    size102 = scaleFactorHeight * 102;
    size120 = scaleFactorHeight * 120;
    size140 = scaleFactorHeight * 140;
    size160 = scaleFactorHeight * 160;
    size180 = scaleFactorHeight * 180;
    size21 = scaleFactorHeight * 21;
    size330 = scaleFactorHeight * 330;
    size300 = scaleFactorHeight * 300;
    size84 = scaleFactorHeight * 84;
    size315 = scaleFactorHeight * 315;
    size136 = scaleFactorHeight * 136;
    size55 = scaleFactorHeight * 55;
    size425 = scaleFactorHeight * 425;
    size293 = scaleFactorHeight * 293;

    size13 = scaleFactorHeight * 13;
    size23 = scaleFactorHeight * 23;
    size70 = scaleFactorHeight * 70;
    size71 = scaleFactorHeight * 71;
    size72 = scaleFactorHeight * 72;
    size76 = scaleFactorHeight * 76;
    size80 = scaleFactorHeight * 80;
    size81 = scaleFactorHeight * 81;
    size90 = scaleFactorHeight * 90;
    size93 = scaleFactorHeight * 93;
    size96 = scaleFactorHeight * 96;
    size100 = scaleFactorHeight * 100;
    size103 = scaleFactorHeight * 103;
    size105 = scaleFactorHeight * 105;
    size437 = scaleFactorHeight * 437;
    size120 = scaleFactorHeight * 120;

    size125 = scaleFactorHeight * 125;
    size140 = scaleFactorHeight * 140;
    size160 = scaleFactorHeight * 160;
    size178 = scaleFactorHeight * 178;
    size180 = scaleFactorHeight * 180;
    size187 = scaleFactorHeight * 187;
    size198 = scaleFactorHeight * 198;
    size215 = scaleFactorHeight * 215;

    size280 = scaleFactorHeight * 280;
    size253 = scaleFactorHeight * 253;

    size21 = scaleFactorHeight * 21;
    size248 = scaleFactorHeight * 248;
    size330 = scaleFactorHeight * 330;
    size300 = scaleFactorHeight * 300;
    size316 = scaleFactorHeight * 316;
    size370 = scaleFactorHeight * 370;
    size397 = scaleFactorHeight * 397;

    size84 = scaleFactorHeight * 84;

    size13 = scaleFactorHeight * 13;
    size268 = scaleFactorHeight * 268;

    size17 = scaleFactorHeight * 17;
    size350 = scaleFactorHeight * 350;
    size170 = scaleFactorHeight * 170;
    size162 = scaleFactorHeight * 162;
    size71 = scaleFactorHeight * 71;
    size72 = scaleFactorHeight * 72;
    size75 = scaleFactorHeight * 75;
    size76 = scaleFactorHeight * 76;
    size77 = scaleFactorHeight * 77;
    size80 = scaleFactorHeight * 80;
    size93 = scaleFactorHeight * 93;

    size90 = scaleFactorHeight * 90;
    size100 = scaleFactorHeight * 100;
    size103 = scaleFactorHeight * 103;
    size105 = scaleFactorHeight * 105;
    size131 = scaleFactorHeight * 131;

    size110 = scaleFactorHeight * 110;
    size120 = scaleFactorHeight * 120;
    size122 = scaleFactorHeight * 122;
    size140 = scaleFactorHeight * 140;
    size160 = scaleFactorHeight * 160;
    size180 = scaleFactorHeight * 180;
    size122 = scaleFactorHeight * 131;
    size129 = scaleFactorHeight * 129;
    size137 = scaleFactorHeight * 137;
    size140 = scaleFactorHeight * 140;
    size142 = scaleFactorHeight * 142;
    size158 = scaleFactorHeight * 158;
    size160 = scaleFactorHeight * 160;
    size168 = scaleFactorHeight * 168;
    size180 = scaleFactorHeight * 180;
    size207 = scaleFactorHeight * 207;
    size21 = scaleFactorHeight * 21;
    size62 = scaleFactorHeight * 62;
    size237 = scaleFactorHeight * 237;
    size330 = scaleFactorHeight * 330;
    size360 = scaleFactorHeight * 360;
    size84 = scaleFactorHeight * 84;
    size121 = scaleFactorHeight * 121;
    size730 = scaleFactorHeight * 730;
    size69 = scaleFactorHeight * 69;
    size74 = scaleFactorHeight * 74;
    size79 = scaleFactorHeight * 79;
    size146 = scaleFactorHeight * 146;
    size63 = scaleFactorHeight * 63;
    size230 = scaleFactorHeight * 230;
    size455 = scaleFactorHeight * 455;
    size253 = scaleFactorHeight * 253;
    size224 = scaleFactorHeight * 224;
    size175 = scaleFactorHeight * 175;
    size278 = scaleFactorHeight * 278;
    size249 = scaleFactorHeight * 249;
    size250 = scaleFactorHeight * 250;
    size17 = scaleFactorHeight * 17;
    size182 = scaleFactorHeight * 182;
    size148 = scaleFactorHeight * 148;
    size243 = scaleFactorHeight * 243;
    size285 = scaleFactorHeight * 285;
    size150 = scaleFactorHeight * 150;
    size320 = scaleFactorHeight * 320;
    size112 = scaleFactorHeight * 112;
    size15 = scaleFactorHeight * 15;
    size9 = scaleFactorHeight * 9;
    size94 = scaleFactorHeight * 94;
    size270 = scaleFactorHeight * 270;
    size232 = scaleFactorHeight * 232;
    size118 = scaleFactorHeight * 118;
    size156 = scaleFactorHeight * 156;
    size317 = scaleFactorHeight * 317;
    size242 = scaleFactorHeight * 242;
    size200 = scaleFactorHeight * 200;
    size240 = scaleFactorHeight * 240;
    size94 = scaleFactorHeight * 94;
    size41 = scaleFactorHeight * 41;
    size258 = scaleFactorHeight * 258;
    size500 = scaleFactorHeight * 500;

    size94 = scaleFactorHeight * 94;
    size98 = scaleFactorHeight * 98;
    size294 = scaleFactorHeight * 294;
    size191 = scaleFactorHeight * 191;
    size41 = scaleFactorHeight * 41;
    size127 = scaleFactorHeight * 127;

    size94 = scaleFactorHeight * 94;
    size98 = scaleFactorHeight * 98;
    size294 = scaleFactorHeight * 294;
    size94 = scaleFactorHeight * 94;
    size270 = scaleFactorHeight * 270;
    size232 = scaleFactorHeight * 232;
    size118 = scaleFactorHeight * 118;
    size156 = scaleFactorHeight * 156;
    size317 = scaleFactorHeight * 317;

    size242 = scaleFactorHeight * 242;
    size218 = scaleFactorHeight * 218;
    size319 = scaleFactorHeight * 319;
    size360 = scaleFactorHeight * 360;
    size255 = scaleFactorHeight * 255;
    size290 = scaleFactorHeight * 290;
    size218 = scaleFactorHeight * 218;
    size218 = scaleFactorHeight * 218;
    size176 = scaleFactorHeight * 176;
    size66 = scaleFactorHeight * 66;
    size53 = scaleFactorHeight * 53;
    size108 = scaleFactorHeight * 108;
    size27 = scaleFactorHeight * 27;
    size87 = scaleFactorHeight * 87;
    size221 = scaleFactorHeight * 221;
    size37 = scaleFactorHeight * 37;
    size82 = scaleFactorHeight * 82;
    size122 = scaleFactorHeight * 122;
    size404 = scaleFactorHeight * 404;
    size178 = scaleFactorHeight * 178;
    size89 = scaleFactorHeight * 89;
    size41 = scaleFactorHeight * 41;
    size326 = scaleFactorHeight * 326;
    size110 = scaleFactorHeight * 110;
    size39 = scaleFactorHeight * 39;
    size31 = scaleFactorHeight * 31;
    size1081 = scaleFactorHeight * 1081;
    size19 = scaleFactorHeight * 19;
    size11 = scaleFactorHeight * 11;
    size115 = scaleFactorHeight * 115;
    size151 = scaleFactorHeight * 151;
    size255 = scaleFactorHeight * 255;
    size135 = scaleFactorHeight * 135;
    size55 = scaleFactorHeight * 55;
    size58 = scaleFactorHeight * 58;
    size86 = scaleFactorHeight * 86;
    size122 = scaleFactorHeight * 122;
    size400 = scaleFactorHeight * 400;
    size447 = scaleFactorHeight * 447;
    size480 = scaleFactorHeight * 480;
    size420 = scaleFactorHeight * 420;
    size104 = scaleFactorHeight * 104;
    size304 = scaleFactorHeight * 304;
    size205 = scaleFactorHeight * 205;
    size294 = scaleFactorHeight * 294;
    size351 = scaleFactorHeight * 351;
    size419 = scaleFactorHeight * 419;
    size553 = scaleFactorHeight * 553;
    size65 = scaleFactorHeight * 65;
    size68 = scaleFactorHeight * 68;
    size69 = scaleFactorHeight * 69;

    size71 = scaleFactorHeight * 71;
    size72 = scaleFactorHeight * 72;
    size76 = scaleFactorHeight * 76;
    size80 = scaleFactorHeight * 80;
    size90 = scaleFactorHeight * 90;
    size93 = scaleFactorHeight * 93;
    size100 = scaleFactorHeight * 100;
    size103 = scaleFactorHeight * 103;
    size105 = scaleFactorHeight * 105;
    size120 = scaleFactorHeight * 120;
    size126 = scaleFactorHeight * 126;

    size125 = scaleFactorHeight * 125;
    size140 = scaleFactorHeight * 140;
    size160 = scaleFactorHeight * 160;
    size117 = scaleFactorHeight * 117;
    size103 = scaleFactorHeight * 103;
    size105 = scaleFactorHeight * 105;
    size120 = scaleFactorHeight * 120;
    size155 = scaleFactorHeight * 155;
    size128 = scaleFactorHeight * 128;

    size420 = scaleFactorHeight * 420;

    size125 = scaleFactorHeight * 125;
    size140 = scaleFactorHeight * 140;
    size47 = scaleFactorHeight * 47;
    size160 = scaleFactorHeight * 160;
    size174 = scaleFactorHeight * 174;
    size180 = scaleFactorHeight * 180;
    size180 = scaleFactorHeight * 186;
    size220 = scaleFactorHeight * 220;
    size550 = scaleFactorHeight * 550;
    size216 = scaleFactorHeight * 216;
    size225 = scaleFactorHeight * 225;
    size178 = scaleFactorHeight * 178;
    size180 = scaleFactorHeight * 180;
    size187 = scaleFactorHeight * 187;
    size198 = scaleFactorHeight * 198;
    size125 = scaleFactorHeight * 125;
    size140 = scaleFactorHeight * 140;
    size160 = scaleFactorHeight * 160;
    size117 = scaleFactorHeight * 117;
    size103 = scaleFactorHeight * 103;
    size105 = scaleFactorHeight * 105;
    size120 = scaleFactorHeight * 120;
    size155 = scaleFactorHeight * 155;
    size128 = scaleFactorHeight * 128;

    size420 = scaleFactorHeight * 420;

    size125 = scaleFactorHeight * 125;
    size140 = scaleFactorHeight * 140;
    size47 = scaleFactorHeight * 47;
    size160 = scaleFactorHeight * 160;
    size174 = scaleFactorHeight * 174;
    size180 = scaleFactorHeight * 180;
    size180 = scaleFactorHeight * 186;
    size220 = scaleFactorHeight * 220;
    size550 = scaleFactorHeight * 550;
    size216 = scaleFactorHeight * 216;
    size225 = scaleFactorHeight * 225;
    size178 = scaleFactorHeight * 178;
    size180 = scaleFactorHeight * 180;
    size187 = scaleFactorHeight * 187;
    size198 = scaleFactorHeight * 198;
    size180 = scaleFactorHeight * 186;
    size188 = scaleFactorHeight * 188;
    size210 = scaleFactorHeight * 210;
    size220 = scaleFactorHeight * 220;
    size550 = scaleFactorHeight * 550;
    size216 = scaleFactorHeight * 216;
    size225 = scaleFactorHeight * 225;
    size178 = scaleFactorHeight * 178;
    size180 = scaleFactorHeight * 180;
    size187 = scaleFactorHeight * 187;
    size198 = scaleFactorHeight * 198;
    size200 = scaleFactorHeight * 200;
    size212 = scaleFactorHeight * 212;
    size225 = scaleFactorHeight * 225;
    size253 = scaleFactorHeight * 253;
    size254 = scaleFactorHeight * 254;

    size330 = scaleFactorHeight * 330;
    size300 = scaleFactorHeight * 300;
    size327 = scaleFactorHeight * 327;
    size315 = scaleFactorHeight * 315;

    size21 = scaleFactorHeight * 21;
    size73 = scaleFactorHeight * 73;
    size121 = scaleFactorHeight * 121;
    size315 = scaleFactorHeight * 315;
    size55 = scaleFactorHeight * 55;

    size122 = scaleFactorHeight * 122;
    size126 = scaleFactorHeight * 126;
    size126 = scaleFactorHeight * 164;
    size126 = scaleFactorHeight * 123;
    size126 = scaleFactorHeight * 296;
    size278 = scaleFactorHeight * 278;
    size212 = scaleFactorHeight * 212;
    size404 = scaleFactorHeight * 404;
    size326 = scaleFactorHeight * 326;
    size110 = scaleFactorHeight * 110;
    size89 = scaleFactorHeight * 89;
    size282 = scaleFactorHeight * 282;
    size115 = scaleFactorHeight * 115;

    size330 = scaleFactorHeight * 330;
    size300 = scaleFactorHeight * 300;
    size300 = scaleFactorHeight * 316;
    size122 = scaleFactorHeight * 122;
    size126 = scaleFactorHeight * 126;
    size126 = scaleFactorHeight * 164;
    size123 = scaleFactorHeight * 123;
    size126 = scaleFactorHeight * 296;
    size278 = scaleFactorHeight * 278;
    size212 = scaleFactorHeight * 212;
    size404 = scaleFactorHeight * 404;
    size326 = scaleFactorHeight * 326;
    size110 = scaleFactorHeight * 110;
    size89 = scaleFactorHeight * 89;

    size330 = scaleFactorHeight * 330;
    size300 = scaleFactorHeight * 300;
    size300 = scaleFactorHeight * 316;
    size122 = scaleFactorHeight * 122;
    size126 = scaleFactorHeight * 126;
    size126 = scaleFactorHeight * 164;
    size123 = scaleFactorHeight * 123;
    size126 = scaleFactorHeight * 123;
    size126 = scaleFactorHeight * 296;
    size278 = scaleFactorHeight * 278;
    size212 = scaleFactorHeight * 212;
    size404 = scaleFactorHeight * 404;
    size326 = scaleFactorHeight * 326;
    size110 = scaleFactorHeight * 110;
    size89 = scaleFactorHeight * 89;

    size330 = scaleFactorHeight * 330;
    size300 = scaleFactorHeight * 300;
    size300 = scaleFactorHeight * 316;

    size327 = scaleFactorHeight * 327;
    size316 = scaleFactorHeight * 316;
    size370 = scaleFactorHeight * 370;

    size84 = scaleFactorHeight * 84;
    size23 = scaleFactorHeight * 23;

    size83 = scaleFactorHeight * 83;
    size13 = scaleFactorHeight * 13;
    size25 = scaleFactorHeight * 25;

    size250 = scaleFactorHeight * 250;
    size17 = scaleFactorHeight * 17;
    size170 = scaleFactorHeight * 170;
    size162 = scaleFactorHeight * 162;
    size186 = scaleFactorHeight * 186;
    size148 = scaleFactorHeight * 148;

    size243 = scaleFactorHeight * 243;
    size295 = scaleFactorHeight * 295;
    size296 = scaleFactorHeight * 296;
    size153 = scaleFactorHeight * 153;
    size172 = scaleFactorHeight * 172;
    size243 = scaleFactorHeight * 243;
    size285 = scaleFactorHeight * 285;

    size150 = scaleFactorHeight * 150;

    size320 = scaleFactorHeight * 320;
    size335 = scaleFactorHeight * 335;
    size358 = scaleFactorHeight * 358;
    size147 = scaleFactorHeight * 147;

    size112 = scaleFactorHeight * 112;
    size410 = scaleFactorHeight * 410;

    size15 = scaleFactorHeight * 15;

    size9 = scaleFactorHeight * 9;
    size41 = scaleFactorHeight * 41;

    size94 = scaleFactorHeight * 94;
    size98 = scaleFactorHeight * 98;
    size294 = scaleFactorHeight * 294;
    size270 = scaleFactorHeight * 270;
    size232 = scaleFactorHeight * 232;

    size317 = scaleFactorHeight * 317;
    size318 = scaleFactorHeight * 318;

    size242 = scaleFactorHeight * 242;
    size200 = scaleFactorHeight * 200;
    size319 = scaleFactorHeight * 319;
    size360 = scaleFactorHeight * 360;

    size242 = scaleFactorHeight * 242;
    size255 = scaleFactorHeight * 255;
    size290 = scaleFactorHeight * 290;
    size218 = scaleFactorHeight * 218;
    size29 = scaleFactorHeight * 29;
    size37 = scaleFactorHeight * 37;
    size310 = scaleFactorHeight * 310;
    size27 = scaleFactorHeight * 27;
    size37 = scaleFactorHeight * 37;
    size82 = scaleFactorHeight * 82;
    size85 = scaleFactorHeight * 85;
    size95 = scaleFactorHeight * 95;

    size122 = scaleFactorHeight * 122;
    size144 = scaleFactorHeight * 144;
    size122 = scaleFactorHeight * 167;
    size400 = scaleFactorHeight * 400;
    size421 = scaleFactorHeight * 421;
    size340 = scaleFactorHeight * 340;
    size350 = scaleFactorHeight * 350;
    size368 = scaleFactorHeight * 368;
    size325 = scaleFactorHeight * 325;
    size600 = scaleFactorHeight * 600;

    size250 = scaleFactorHeight * 250;

    size83 = scaleFactorHeight * 83;

    size153 = scaleFactorHeight * 153;
    size250 = scaleFactorHeight * 250;
    size17 = scaleFactorHeight * 17;
    size170 = scaleFactorHeight * 170;
    size162 = scaleFactorHeight * 162;
    size186 = scaleFactorHeight * 186;

    size148 = scaleFactorHeight * 148;

    size266 = scaleFactorHeight * 266;
    size243 = scaleFactorHeight * 243;
    size295 = scaleFactorHeight * 295;
    size296 = scaleFactorHeight * 296;
    size153 = scaleFactorHeight * 153;
    size172 = scaleFactorHeight * 172;
    size243 = scaleFactorHeight * 243;
    size285 = scaleFactorHeight * 285;

    size150 = scaleFactorHeight * 150;

    size320 = scaleFactorHeight * 320;
    size335 = scaleFactorHeight * 335;
    size358 = scaleFactorHeight * 358;

    size112 = scaleFactorHeight * 112;
    size410 = scaleFactorHeight * 410;

    size15 = scaleFactorHeight * 15;

    size9 = scaleFactorHeight * 9;
    size41 = scaleFactorHeight * 41;
    size164 = scaleFactorHeight * 164;
    size123 = scaleFactorHeight * 123;
    size296 = scaleFactorHeight * 296;

    size94 = scaleFactorHeight * 94;
    size98 = scaleFactorHeight * 98;
    size294 = scaleFactorHeight * 294;
    size270 = scaleFactorHeight * 270;
    size232 = scaleFactorHeight * 232;

    size317 = scaleFactorHeight * 317;
    size318 = scaleFactorHeight * 318;

    size242 = scaleFactorHeight * 242;
    size200 = scaleFactorHeight * 200;
    size319 = scaleFactorHeight * 319;
    size360 = scaleFactorHeight * 360;

    size242 = scaleFactorHeight * 242;
    size255 = scaleFactorHeight * 255;
    size290 = scaleFactorHeight * 290;
    size218 = scaleFactorHeight * 218;
    size29 = scaleFactorHeight * 29;
    size37 = scaleFactorHeight * 37;
    size310 = scaleFactorHeight * 310;
    size27 = scaleFactorHeight * 27;
    size37 = scaleFactorHeight * 37;
    size82 = scaleFactorHeight * 82;
    size85 = scaleFactorHeight * 85;
    size95 = scaleFactorHeight * 95;

    size122 = scaleFactorHeight * 122;
    size144 = scaleFactorHeight * 144;
    size167 = scaleFactorHeight * 167;
    size400 = scaleFactorHeight * 400;
    size421 = scaleFactorHeight * 421;
    size340 = scaleFactorHeight * 340;
    size350 = scaleFactorHeight * 350;
    size368 = scaleFactorHeight * 368;
    size325 = scaleFactorHeight * 325;
    size600 = scaleFactorHeight * 600;
    size148 = scaleFactorHeight * 148;

    size243 = scaleFactorHeight * 243;
    size295 = scaleFactorHeight * 295;
    size296 = scaleFactorHeight * 296;
    size153 = scaleFactorHeight * 153;
    size172 = scaleFactorHeight * 172;
    size243 = scaleFactorHeight * 243;
    size285 = scaleFactorHeight * 285;

    size150 = scaleFactorHeight * 150;
    size320 = scaleFactorHeight * 320;
    size335 = scaleFactorHeight * 335;
    size358 = scaleFactorHeight * 358;

    size112 = scaleFactorHeight * 112;
    size410 = scaleFactorHeight * 410;

    size15 = scaleFactorHeight * 15;

    size41 = scaleFactorHeight * 41;

    size94 = scaleFactorHeight * 94;
    size98 = scaleFactorHeight * 98;
    size294 = scaleFactorHeight * 294;
    size270 = scaleFactorHeight * 270;
    size232 = scaleFactorHeight * 232;

    size317 = scaleFactorHeight * 317;
    size318 = scaleFactorHeight * 318;

    size242 = scaleFactorHeight * 242;
    size200 = scaleFactorHeight * 200;
    size319 = scaleFactorHeight * 319;
    size360 = scaleFactorHeight * 360;

    size242 = scaleFactorHeight * 242;
    size255 = scaleFactorHeight * 255;
    size290 = scaleFactorHeight * 290;
    size218 = scaleFactorHeight * 218;
    size29 = scaleFactorHeight * 29;
    size37 = scaleFactorHeight * 37;
    size310 = scaleFactorHeight * 310;
    size27 = scaleFactorHeight * 27;
    size37 = scaleFactorHeight * 37;
    size82 = scaleFactorHeight * 82;
    size85 = scaleFactorHeight * 85;
    size95 = scaleFactorHeight * 95;

    size122 = scaleFactorHeight * 122;
    size144 = scaleFactorHeight * 144;
    size122 = scaleFactorHeight * 167;
    size400 = scaleFactorHeight * 400;
    size421 = scaleFactorHeight * 421;
    size340 = scaleFactorHeight * 340;
    size350 = scaleFactorHeight * 350;
    size368 = scaleFactorHeight * 368;
    size325 = scaleFactorHeight * 325;
    size600 = scaleFactorHeight * 600;
    size9 = scaleFactorHeight * 9;
    size250 = scaleFactorHeight * 250;

    size83 = scaleFactorHeight * 83;

    size153 = scaleFactorHeight * 153;

    size210 = scaleFactorHeight * 210;
    size121 = scaleFactorHeight * 121;
    size280 = scaleFactorHeight * 280;
    size155 = scaleFactorHeight * 155;
    size128 = scaleFactorHeight * 128;
    size690 = scaleFactorHeight * 690;
    size635 = scaleFactorHeight * 635;
    size88 = scaleFactorHeight * 88;
    size78 = scaleFactorHeight * 78;
    size167 = scaleFactorHeight * 167;
    size13 = scaleFactorHeight * 13;
    size405 = scaleFactorHeight * 405;
    size303 = scaleFactorHeight * 303;
    size78 = scaleFactorHeight * 78;
    size79 = scaleFactorHeight * 79;
    size8 = scaleFactorHeight * 8;

    size167 = scaleFactorHeight * 167;
    size13 = scaleFactorHeight * 13;
    size582 = scaleFactorHeight * 582;
    size470 = scaleFactorHeight * 470;
  }

  static double getScaledSizeWidth(double size) {
    return (size * scaleFactorWidth);
  }

  static double getScaledSizeHeight(double size) {
    return (size * scaleFactorHeight);
  }
}

class Spacing {
  static EdgeInsetsGeometry zero = EdgeInsets.zero;

  static EdgeInsetsGeometry only(
      {double top = 0, double right = 0, double bottom = 0, double left = 0}) {
    return EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
  }

  static EdgeInsetsGeometry fromLTRB(
      double left, double top, double right, double bottom) {
    return Spacing.only(bottom: bottom, top: top, right: right, left: left);
  }

  static EdgeInsetsGeometry all(double spacing) {
    return Spacing.only(
        bottom: spacing, top: spacing, right: spacing, left: spacing);
  }

  static EdgeInsetsGeometry left(double spacing) {
    return Spacing.only(left: spacing);
  }

  static EdgeInsetsGeometry nLeft(double spacing) {
    return Spacing.only(top: spacing, bottom: spacing, right: spacing);
  }

  static EdgeInsetsGeometry top(double spacing) {
    return Spacing.only(top: spacing);
  }

  static EdgeInsetsGeometry nTop(double spacing) {
    return Spacing.only(left: spacing, bottom: spacing, right: spacing);
  }

  static EdgeInsetsGeometry right(double spacing) {
    return Spacing.only(right: spacing);
  }

  static EdgeInsetsGeometry nRight(double spacing) {
    return Spacing.only(top: spacing, bottom: spacing, left: spacing);
  }

  static EdgeInsetsGeometry bottom(double spacing) {
    return Spacing.only(bottom: spacing);
  }

  static EdgeInsetsGeometry nBottom(double spacing) {
    return Spacing.only(top: spacing, left: spacing, right: spacing);
  }

  static EdgeInsetsGeometry horizontal(double spacing) {
    return Spacing.only(left: spacing, right: spacing);
  }

  static x(double spacing) {
    return Spacing.only(left: spacing, right: spacing);
  }

  static xy(double xSpacing, double ySpacing) {
    return Spacing.only(
        left: xSpacing, right: xSpacing, top: ySpacing, bottom: ySpacing);
  }

  static y(double spacing) {
    return Spacing.only(top: spacing, bottom: spacing);
  }

  static EdgeInsetsGeometry vertical(double spacing) {
    return Spacing.only(top: spacing, bottom: spacing);
  }

  static EdgeInsetsGeometry symmetric(
      {double vertical = 0, double horizontal = 0}) {
    return Spacing.only(
        top: vertical, right: horizontal, left: horizontal, bottom: vertical);
  }

  static Widget height(double height) {
    return SizedBox(
      height: height,
    );
  }

  static Widget width(double width) {
    return SizedBox(
      width: width,
    );
  }
}

class Space {
  Space();

  static Widget height(double space) {
    return SizedBox(
      height: MySize.getScaledSizeHeight(space),
    );
  }

  static Widget width(double space) {
    return SizedBox(
      width: MySize.getScaledSizeHeight(space),
    );
  }
}

enum ShapeTypeFor { container, button }

class Shape {
  static dynamic circular(double radius,
      {ShapeTypeFor shapeTypeFor = ShapeTypeFor.container}) {
    BorderRadius borderRadius =
        BorderRadius.all(Radius.circular(MySize.getScaledSizeHeight(radius)));

    switch (shapeTypeFor) {
      case ShapeTypeFor.container:
        return borderRadius;
      case ShapeTypeFor.button:
        return RoundedRectangleBorder(borderRadius: borderRadius);
    }
  }

  static dynamic circularTop(double radius,
      {ShapeTypeFor shapeTypeFor = ShapeTypeFor.container}) {
    BorderRadius borderRadius = BorderRadius.only(
        topLeft: Radius.circular(MySize.getScaledSizeHeight(radius)),
        topRight: Radius.circular(MySize.getScaledSizeHeight(radius)));
    switch (shapeTypeFor) {
      case ShapeTypeFor.container:
        return borderRadius;

      case ShapeTypeFor.button:
        return RoundedRectangleBorder(borderRadius: borderRadius);
    }
  }
}

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}
