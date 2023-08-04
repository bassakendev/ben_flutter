// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, file_names

import 'package:ben_flutter/dataBase/StoragesUtils.dart';
import 'package:flutter/material.dart';

import '../../appAppearance/AppAppearance.dart';
import '../../dataBase/Task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main.dart';

class Langues extends StatefulWidget {
  @override
  _LanguesState createState() => _LanguesState();
}

class _LanguesState extends State<Langues> {
  AppAppearance app = AppAppearance();

  String selectedLanguage = '';
  void getFastLang() async {
    final loadedLang = await StoragesUtils.getLang();

    setState(() {
      selectedLanguage = loadedLang;
    });
  }

  @override
  Widget build(BuildContext context) {
    getFastLang();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: app.appearance(light, themes).primaryColor,
        title: Text(AppLocalizations.of(context)!.langue),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.choisissezUneLangue,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                languageButton(AppLocalizations.of(context)!.francais, 'fr'),
                languageButton(AppLocalizations.of(context)!.anglais, 'en'),
                languageButton(AppLocalizations.of(context)!.espagnol, 'es'),
                languageButton(AppLocalizations.of(context)!.allemand, 'de'),
                languageButton(AppLocalizations.of(context)!.portugais, 'pt'),
                languageButton(AppLocalizations.of(context)!.italien, 'it'),
                languageButton(AppLocalizations.of(context)!.arabe, 'ar'),
                languageButton(AppLocalizations.of(context)!.russe, 'ru'),
              ],
            ),
            SizedBox(height: 30),
            Text(
              AppLocalizations.of(context)!.langueSelectionnee,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: app.appearance(light, themes).secondlyColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  getLangName(selectedLanguage, context),
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget languageButton(String languageName, String languageCode) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = languageCode;
          Future<void> fast() async {
            await StoragesUtils.setLang(languageCode);
          }

          fast();
        });
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => MyApp())));
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: selectedLanguage == languageCode
              ? app.appearance(light, themes).secondlyColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            languageName,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

String getLangName(String langCode, context) {
  switch (langCode) {
    case 'fr':
      return AppLocalizations.of(context)!.francais;
    case 'en':
      return AppLocalizations.of(context)!.anglais;
    case 'pt':
      return AppLocalizations.of(context)!.portugais;
    case 'ar':
      return AppLocalizations.of(context)!.arabe;
    case 'ru':
      return AppLocalizations.of(context)!.russe;
    case 'es':
      return AppLocalizations.of(context)!.espagnol;
    case 'it':
      return AppLocalizations.of(context)!.italien;
    case 'de':
      return AppLocalizations.of(context)!.allemand;
    default:
      return AppLocalizations.of(context)!.anglais;
  }
}
