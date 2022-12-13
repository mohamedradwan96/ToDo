import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class ThemeModeBottomSheet extends StatelessWidget {
  const ThemeModeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeThemeMOde(ThemeMode.light);
              Navigator.pop(context);
            },
            child: themeItem(context, 'Light', provider),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider.changeThemeMOde(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: themeItem(context, 'Dark', provider),
          ),
        ],
      ),
    );
  }

  Widget themeItem(BuildContext context, String text, MyProvider pro) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                color: !((pro.mode == ThemeMode.light && text == 'Light') ||
                        (pro.mode == ThemeMode.dark && text == 'Dark'))
                    ? Theme.of(context).backgroundColor
                    : Theme.of(context).primaryColor),
          ),
          Icon(Icons.done,
              size: 30,
              color: !((pro.mode == ThemeMode.light && text == 'Light') ||
                      (pro.mode == ThemeMode.dark && text == 'Dark'))
                  ? Theme.of(context).backgroundColor
                  : Theme.of(context).primaryColor)
        ],
      );
}
