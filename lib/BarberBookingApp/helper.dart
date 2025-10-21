import 'dart:ui';
import 'package:flutter/material.dart';

class Appwidget{
  static  TextStyle bold(Color color ,double size){
    return TextStyle(
      color:color,
      fontSize: size,
      fontWeight: FontWeight.bold
    );
  }
}