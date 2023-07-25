import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/common/utils.dart';
import 'package:jinie_builder/features/checkbox_color.dart';
import 'package:jinie_builder/models/user_info.dart';

enum LangParamLabel {
  paramNull('---SELECT---', [], ''),
  paramLang('LANG', [], 'all'),
  paramAllLang('ALL_LANG', [], 'all'),
  paramNaLang('NA_LANG', [], 'mobis'),
  paramSeaLang('SEA_LANG', [], 'mobis'),
  paramTtsOnly('TTS_ONLY', [], 'all'),
  paramNaviO('NAVI_O', [], 'lge'),
  paramNaviX('NAVI_X', [], 'lge'),
  paramVdeLang('VDE_LANG', [], 'lge');

  const LangParamLabel(this.title, this.langs, this.vendor);
  final String title;
  final List<String> langs;
  final String vendor;
}

class CountryLanguageList extends StatefulWidget {
  final String theme;
  final UserInfo userInfo;

  const CountryLanguageList({
    super.key,
    required this.theme,
    required this.userInfo,
  });

  @override
  State<CountryLanguageList> createState() => _CountryLanguageList();
}

class _CountryLanguageList extends State<CountryLanguageList> {
  late String theme;
  late UserInfo userInfo;
  String cvValue = 'none';
  Map<String, dynamic> langs = {};
  LangParamLabel? selectedLangParam;

  var countryList = [
    "KO",
    "NA",
    "EU",
    "BR",
    "IN",
    "JP",
    "ID",
    "SG",
    "ME",
    "AU",
    "CHN"
  ];
  Map<String, bool> languageList = {};

  @override
  void initState() {
    theme = widget.theme;
    userInfo = widget.userInfo;
    super.initState();
  }

  Color getColor(Set<MaterialState> states) => getCheckboxColor(states, theme);

  Future<void> checkCountryVariant(String cv) async {
    cvValue = cv;
    List<String> result = await setLangByPlatform(cv, userInfo.platform);

    setState(() {
      languageList.clear();
      for (String lang in result) {
        languageList[lang] = true;
      }
    });
  }

  checkLanguages(String key, bool value) {
    setState(() {
      languageList.addAll({key: value});
    });
  }

  List<dynamic> parsingLangs(Map<String, bool> langs) {
    List<dynamic> ret = [];
    if (langs.isEmpty) {
      return [];
    } else {
      langs.forEach(
        (key, value) {
          if (value) {
            ret.add(key);
          }
        },
      );
      return ret;
    }
  }

  applyLangParam(String param, Map<String, bool> langs) {
    setState(() {
      userInfo.langs[userInfo.vendor][param].clear();
      userInfo.langs[userInfo.vendor][param] = parsingLangs(langs);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<LangParamLabel>> langParamEntries =
        <DropdownMenuEntry<LangParamLabel>>[];
    for (final LangParamLabel langParam in LangParamLabel.values) {
      langParamEntries.add(
        DropdownMenuEntry<LangParamLabel>(
          value: langParam,
          label: langParam.title,
          enabled:
              langParam.vendor == 'all' || langParam.vendor == userInfo.vendor,
        ),
      );
    }

    return Column(
      children: [
        Wrap(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < countryList.length; i++)
              Column(
                children: [
                  Text(
                    countryList[i],
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: cvValue == countryList[i],
                    onChanged: (value) => {
                      if (value!)
                        {checkCountryVariant(countryList[i])}
                      else
                        {checkCountryVariant('none')}
                    },
                  ),
                ],
              ),
          ],
        ),
        const Divider(
          height: 10,
          color: Colors.black,
        ),
        Wrap(
          children: [
            for (var key in languageList.keys)
              // for (int i = 0; i < languageList.length; i++)
              Column(
                children: [
                  Text(
                    key,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: languageList[key],
                    onChanged: (value) => {
                      if (value!)
                        checkLanguages(key, true)
                      else
                        checkLanguages(key, false)
                    },
                  ),
                ],
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownMenu(
                initialSelection: LangParamLabel.paramNull,
                label: const Text('Select Option'),
                dropdownMenuEntries: langParamEntries,
                onSelected: (LangParamLabel? param) {
                  setState(() {
                    selectedLangParam = param;
                  });
                },
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedLangParam != null) {
                    applyLangParam(selectedLangParam!.title, languageList);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme == 'pink'
                      ? AppTheme.pinkMint
                      : AppTheme.indigoYellow,
                  foregroundColor: theme == 'pink'
                      ? AppTheme.pinkStrongPink
                      : AppTheme.indigoDarkBlue,
                  shadowColor: Colors.black,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.5,
                      color: theme == 'pink'
                          ? AppTheme.pinkGreen
                          : AppTheme.indigoYellow,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'SET',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: theme == 'pink'
                        ? AppTheme.pinkDarkGrey
                        : AppTheme.indigoDarkGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final String param
                      in userInfo.langs[userInfo.vendor].keys)
                    Text(
                      param,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final List<dynamic> param
                        in userInfo.langs[userInfo.vendor].values)
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          param.isEmpty ? "" : param.toString(),
                          style: TextStyle(
                            color: theme == 'pink'
                                ? AppTheme.pinkGreen
                                : AppTheme.indigoDeepBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: true,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
