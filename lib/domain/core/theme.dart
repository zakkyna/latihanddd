import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color mainColor = Color(0xFFFFD51E);
const Color yellowButtonColor = Color(0xFFFFC800);
const Color blueLinkColor = Color(0xFF031152);

const double defaultBorderRadius = 15;
const double defaultMargin = 20;

TextStyle hintStyle = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600);

TextStyle inputStyle = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500);

TextStyle blueLinkStyle = GoogleFonts.poppins()
    .copyWith(color: blueLinkColor, fontSize: 14, fontWeight: FontWeight.w600);

TextStyle buttonLabelStyle1 =
    GoogleFonts.poppins().copyWith(fontSize: 22, fontWeight: FontWeight.w600);
