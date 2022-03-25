import 'package:flutter/material.dart';

// colors

const Color BACKGROUND_TEXT_COLOR = Color.fromARGB(255, 255, 255, 255);

const Color BACKGROUND_COLOR = Color.fromARGB(255, 233, 240, 237);

const Color TOPBAR_COLOR = Color.fromARGB(255, 147, 163, 155);

const Color BOTTOMBAR_COLOR = Color.fromARGB(255, 143, 160, 152);

const Color BUTTON_COLOR = Colors.black;

const Color HOMESCREEN_BUTTONS_COLOR = Color.fromARGB(255, 209, 223, 218);

const Color BOTTOMBAR_HELP_OUTLINE_COLOR = Color.fromARGB(255, 130, 150, 140);

const Color TEXT_COLOR_BLACK = Colors.black;
const Color TEXT_COLOR_DISABLED = Color.fromARGB(94, 0, 0, 0);
const Color TEXT_COLOR_WHITE = Colors.white;
const Color TEXT_COLOR_ZONE_FINISHED =  Color.fromARGB(255, 130, 150, 140);

const Color ANIMATION_BEGIN_COLOR = Color.fromARGB(255, 244, 255, 244);
const Color ANIMATION_END_COLOR = Colors.black12;

const Color PROGRESSBAR_BAR_COLOR = Color.fromARGB(255, 96, 167, 98);
const Color PROGRESSBAR_BAR_BACKGROUND_COLOR =
    Color.fromARGB(255, 203, 223, 203);

const Color CARD_BACKGROUND_COLOR = Color.fromARGB(255, 242, 243, 243);
const Color CARD_BORDER_COLOR = Color.fromARGB(255, 136, 136, 136);
const Color CARD_ACT_BTN_COLOR = Color.fromARGB(255, 242, 243, 243);
const Color CARD_ACT_BTN_BORDER_COLOR = Color.fromARGB(255, 156, 184, 171);

const Color DROPDOWN_COLOR = Colors.white;

//margins

const double HOMESCREEN_COUNT_BTN_MARGIN = 70;
const double HOMESCREEN_RESUME_COUNT_BTN_MARGIN = 20;
const double HOMESCREEN_SETTINGS_BTN_MARGIN = 90;
const double HOMESCREEN_HELP_BTN_MARGIN = 20;

const double CONFIRM_PAGE_MARGIN_WIDTH_FACTOR = 0.07;
const double CONFIRM_PAGE_DROPDOWN_MARGIN_FACTOR = 0.03;

const double HELP_BOX_MARGIN_FACTOR = 0.8;

//size

const double HOMESCREEN_BTN_WIDTH_FACTOR = 0.7;
const double HOMESCREEN_BTN_HEIGHT_FACTOR = 0.1;
const double HOMESCREEN_TOPBAR_HEIGHT_FACTOR = 0.1;

const double ACTIVITY_INC_DEC_BUTTONS_FACTOR = 0.07;

//fonts

const double HOMESCREEN_TITLE_FONTSIZE = 25;
const double HOMESCREEN_BTN_FONTSIZE = 17;
const double CONFIRM_PAGE_REWIEWLIST_FONTSIZE = 17;
const double CONFIRM_PAGE_REWIEWLIST_HEADER_FONTSIZE = 22;
const double ACTIVITY_TOP_TITLE_FONTSIZE = 20;
const double ACTIVITY_MANUAL_INPUT_FONTSIZE = 18;
const double ACTIVITY_BOTTOMBAR_FONTSIZE = 18;
const double COUNT_BOTTOMBAR_FONTSIZE = 18;

//paddings

const double CONFIRM_PAGE_HEADER_PADDING_FACTOR = 0.10;
const double CONFIRM_PAGE_HEADER_PADDING_BOTTOM_FACTOR = 0.02;
const double CONFIRM_PAGE_HEADER_PADDING_TOP_FACTOR = 0.03;

//border radius

const double BOX_BORDER_RADIUS = 20;

//shadows

final SHADOW_ACT_CARD =
    BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
  BoxShadow(
    color: Colors.grey.withOpacity(0.25),
    offset: Offset(0, 3),
    blurRadius: 1.5,
    spreadRadius: 0.2,
  )
]);

final SHADOW_HOMESCREEN_BTN =
    BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
  BoxShadow(
    color: Colors.grey.withOpacity(0.25),
    offset: Offset(0, 3),
    blurRadius: 1.5,
    spreadRadius: 0.5,
  )
]);

final SHADOW_HELPSETTINGS_CONTAINER = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.25),
    offset: Offset(0, 3),
    blurRadius: 2,
    spreadRadius: 1,
  )
];

final SHADOW_ZONELIST_BTN =
    BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
  BoxShadow(
    color: Colors.grey.withOpacity(0.25),
    offset: Offset(0, 3),
    blurRadius: 1,
    spreadRadius: 0.2,
  )
]);

final SHADOW_CONFIRM_REVIEWLIST = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.25),
    offset: Offset(0, 3),
    blurRadius: 2,
    spreadRadius: 1,
  )
];

final SHADOW_CONFIRM_DROPDOWN = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.25),
    offset: Offset(0, 3),
    blurRadius: 2,
    spreadRadius: 1,
  )
];

//toast

const Color TOAST_BACKGROUND_COLOR = Color.fromARGB(255, 233, 240, 237);
const Color TOAST_TEXT_COLOR = Colors.black;
const double TOAST_FONT_SIZE = 15;
