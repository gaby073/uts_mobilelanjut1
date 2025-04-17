// file: lib/providers/zodiak_provider.dart
import 'package:flutter/material.dart';
import '../models/user_data.dart';

class ZodiakProvider extends ChangeNotifier {
  UserData? _user;
  String _zodiak = "";
  String _bulanKarakter = "";
  String _ramalan = "";

  void setUser(UserData user) {
    _user = user;
    _calculateZodiak();
    notifyListeners();
  }

  void _calculateZodiak() {
    final date = _user!.tanggalLahir;
    final day = date.day;
    final month = date.month;

    // Zodiak berdasarkan tanggal
    if ((month == 12 && day >= 21) || (month == 1 && day <= 19)) {
      _zodiak = "Capricorn";
      _ramalan = "Orang Capricorn mengutamakan kesuksesan, loyalitas...";
    } else if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      _zodiak = "Aquarius";
      _ramalan = "Aquarius tertarik dengan petualangan, hak asasi...";
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      _zodiak = "Pisces";
      _ramalan = "Pisces mengutamakan cinta universal, bersifat manja...";
    } else if ((month == 3 && day >= 21) || (month == 4 && day <= 20)) {
      _zodiak = "Aries";
      _ramalan = "Aries berani, yakin, inisiatif, mengutamakan tindakan...";
    } else if ((month == 4 && day >= 21) || (month == 5 && day <= 20)) {
      _zodiak = "Taurus";
      _ramalan = "Taurus mengutamakan kekayaan, loyalitas, daya rasa...";
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      _zodiak = "Gemini";
      _ramalan = "Gemini terampil komunikasi, suka bepergian, serbaguna...";
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 20)) {
      _zodiak = "Cancer";
      _ramalan = "Cancer menyukai keluarga, makanan, ada simpati...";
    } else if ((month == 7 && day >= 21) || (month == 8 && day <= 21)) {
      _zodiak = "Leo";
      _ramalan = "Leo cinta, pemurah, kepemimpinan, hiburan...";
    } else if ((month == 8 && day >= 22) || (month == 9 && day <= 22)) {
      _zodiak = "Virgo";
      _ramalan = "Virgo suka kerja, hasil sempurna, praktis...";
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      _zodiak = "Libra";
      _ramalan = "Libra harmonis, seimbang, diplomatis, ceria...";
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 22)) {
      _zodiak = "Scorpio";
      _ramalan = "Scorpio kreatif, sensual, menyembuhkan, ekstrim...";
    } else if ((month == 11 && day >= 23) || (month == 12 && day <= 20)) {
      _zodiak = "Sagitarius";
      _ramalan = "Sagitarius suka belajar, optimis, bercita-cita tinggi...";
    }

    // Karakter bulan
    const bulanList = [
      "Si Ambisius",
      "Si Pemikir yang Filosofis",
      "Si Penengah Konflik",
      "Si Penyuka Tantangan",
      "Si Cerdas yang Atraktif",
      "Si Kalem",
      "Si Extrovert",
      "Si Pemimpin Alami",
      "Si Penyuka Detail",
      "Si Penebar Aura Positif",
      "Si Pengamat yang Misterius",
      "Si Kuat yang Inspiratif",
    ];
    _bulanKarakter = bulanList[month - 1];
  }

  String get zodiak => _zodiak;
  String get ramalan => _ramalan;
  String get bulanKarakter => _bulanKarakter;
  UserData? get user => _user;
}
