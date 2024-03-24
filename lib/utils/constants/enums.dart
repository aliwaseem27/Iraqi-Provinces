import 'package:flutter/material.dart';

enum Province {

  empty (
    title: "",
  ),
  baghdad(
    title: "Baghdad",
  ),
  duhok(
    title: "Duhok",
  ),
  erbil(
    title: "Erbil",
  ),
  basra(
    title: "Basra",
  ),
  muthanna(
    title: "Muthanna",
  ),
  sulaymaniyah(
    title: "Sulaymaniyah",
  ),
  diyala(
    title: "Diyala",
  ),
  wasit(
    title: "Wasit",
  ),
  maysan(
    title: "Maysan",
  ),
  alAnbar(
    title: "Al-Anbar",
  ),
  najaf(
    title: "Najaf",
  ),
  ninawa(
    title: "Ninawa",
  ),
  salahAlDin(
    title: "Salah Al-Din",
  ),
  kirkuk(
    title: "Kirkuk",
  ),
  babil(
    title: "Babil",
  ),
  alQadisiyyah(
    title: "Al-Qadisiyyah",
  ),
  dhiQar(
    title: "Dhi Qar",
  ),
  karbala(
    title: "Karbala",
  );

  final String title;

  const Province({
    required this.title,
  });

  factory Province.fromString(String countryName){
    switch(countryName){
      case "Baghdad":
        return Province.baghdad;
      case "Duhok":
        return Province.duhok;
      case "Erbil":
        return Province.erbil;
      case "Basra":
        return Province.basra;
      case "Muthanna":
        return Province.muthanna;
      case "Sulaymaniyah":
        return Province.sulaymaniyah;
      case "Diyala":
        return Province.diyala;
      case "Wasit":
        return Province.wasit;
      case "Maysan":
        return Province.maysan;
      case "Al-Anbar":
        return Province.alAnbar;
      case "Najaf":
        return Province.najaf;
      case "Ninawa":
        return Province.ninawa;
      case "Salah Al-Din":
        return Province.salahAlDin;
      case "Kirkuk":
        return Province.kirkuk;
      case "Babil":
        return Province.babil;
      case "Al-Qadisiyyah":
        return Province.alQadisiyyah;
      case "Dhi Qar":
        return Province.dhiQar;
      case "Karbala":
        return Province.karbala;
      default:
        return Province.empty;
    }
  }
}
