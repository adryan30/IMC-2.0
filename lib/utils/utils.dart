import 'package:flutter/material.dart';

ThemeData appThemeData() {
  return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: hexToColor("#0A0D22"),
      sliderTheme: SliderThemeData(
          thumbColor: hexToColor("#EB1555"),
          inactiveTrackColor: Colors.white,
          activeTrackColor: Colors.white,
          overlayColor: Color.fromARGB(120, 49, 20, 47)),
      appBarTheme: AppBarTheme(
        color: hexToColor("#0A0D22"),
        elevation: 10,
      ),
      bottomAppBarColor: hexToColor("#EB1555"),
      cardColor: hexToColor("#111428"));
}

// Construct a color from a hex code string, of the format #RRGGBB.
Color hexToColor(String code) =>
    Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);

class DefaultColors {
  static Color disabled = hexToColor("#8E8E98");
}

Map rank = {
  "Abaixo": [
    "Abaixo do peso",
    hexToColor("#FFEB3B"),
    "Menor que 18.5 kg/m²",
    "Você está abaixo do peso. Tente se alimentar melhor!"
  ],
  "Normal": [
    "Normal",
    hexToColor("#22E67B"),
    "18.5 - 24.9 kg/m²",
    "Você está com um peso normal. Bom trabalho!"
  ],
  "Sobrepeso": [
    "Sobrepeso",
    hexToColor("#F44336"),
    "25.0 - 29.9 kg/m²",
    "Você está no sobrepeso. Tente reduzir lanches não-saudáveis!"
  ],
  "Obeso 1": [
    "Obesidade Nível 1",
    hexToColor("#D32F2F"),
    "30.0 - 34.9 kg/m²",
    "Você está na Obesidade Nível 1. Hora de começar uma dieta!"
  ],
  "Obeso 2": [
    "Obesidade Nível 2",
    hexToColor("#C62828"),
    "35.0 - 39.9 kg/m²",
    "Você está na Obesidade Nível 2. Hora de começar uma dieta!"
  ],
  "Obeso 3": [
    "Obesidade Nível 3",
    hexToColor("#B71C1C"),
    "Acima de 40.0 kg/m²",
    "Você está na Obesidade Nível 3. Hora de começar uma dieta!"
  ],
};
