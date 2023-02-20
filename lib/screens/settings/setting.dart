import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/screens/settings/theme_bottom_sheet.dart';
import 'package:to_do/shared/styel/colors.dart';

import '../../provider/app_provider.dart';
import 'language_bottom_sheet.dart';


class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Language',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: primaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                pro.languageCode == 'en' ? 'English' : "Arabic",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Theme',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: primaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showThemeModeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                pro.mode.name,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          )
        ],
      ),
    );
  }

  void showThemeModeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const ThemeModeBottomSheet();
        });
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const LanguageBottomSheet();
        });
  }
}
