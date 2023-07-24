import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';
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

class CountryVariantList extends StatefulWidget {
  final String theme;
  final UserInfo userInfo;

  const CountryVariantList({
    super.key,
    required this.theme,
    required this.userInfo,
  });

  @override
  State<CountryVariantList> createState() => _CountryVariantListState();
}

class _CountryVariantListState extends State<CountryVariantList> {
  late String theme;
  late UserInfo userInfo;
  String cvValue = 'none';
  List<Map<String, dynamic>> langs = [];
  LangParamLabel? selectedLangParam;

  var countryList = [
    "KOR",
    "NA",
    "EUR",
    "RUS",
    "SEA",
    "CHN",
    "JPN",
  ];
  List<Map<String, dynamic>> languageList = [
    {"label": "KOK", "checked": false},
    {"label": "ENU", "checked": false},
    {"label": "FRC", "checked": false},
    {"label": "SPM", "checked": false},
    {"label": "ENG", "checked": false},
    {"label": "FRF", "checked": false},
    {"label": "GED", "checked": false},
    {"label": "DUN", "checked": false},
    {"label": "ITI", "checked": false},
    {"label": "SPE", "checked": false},
    {"label": "RUR", "checked": false},
    {"label": "CZC", "checked": false},
    {"label": "DAD", "checked": false},
    {"label": "PLP", "checked": false},
    {"label": "PTP", "checked": false},
    {"label": "SWS", "checked": false},
    {"label": "TRT", "checked": false},
    {"label": "NON", "checked": false},
    {"label": "FIF", "checked": false},
    {"label": "GRG", "checked": false},
    {"label": "BGB", "checked": false},
    {"label": "ENA", "checked": false},
    {"label": "HRH", "checked": false},
    {"label": "HUH", "checked": false},
    {"label": "ROR", "checked": false},
    {"label": "SKS", "checked": false},
    {"label": "SLS", "checked": false},
    {"label": "UKU", "checked": false},
    {"label": "ENI", "checked": false},
    {"label": "JPJ", "checked": false},
    {"label": "IDI", "checked": false},
    {"label": "MNC", "checked": false},
    {"label": "CAH", "checked": false}
  ];

  @override
  void initState() {
    theme = widget.theme;
    userInfo = widget.userInfo;
    super.initState();
  }

  Color getColor(Set<MaterialState> states) => getCheckboxColor(states, theme);

  checkState(String cv) {
    setState(() {
      cvValue = cv;
      switch (cv) {
        case 'KOR':
          languageList = [
            {
              'label': 'KOK',
              'checked': true,
            },
            {
              'label': 'ENU',
              'checked': true,
            }
          ];
          break;
        case 'NA':
          languageList = [
            {
              'label': 'KOK',
              'checked': true,
            },
            {
              'label': 'ENU',
              'checked': true,
            },
            {
              'label': 'FRC',
              'checked': true,
            },
            {
              'label': 'SPM',
              'checked': true,
            }
          ];
          break;
        case 'EUR':
          languageList = [
            {
              'label': 'KOK',
              'checked': true,
            },
            {
              'label': 'ENG',
              'checked': true,
            },
            {
              'label': 'FRF',
              'checked': true,
            },
            {
              'label': 'SPE',
              'checked': true,
            },
            {
              'label': 'GED',
              'checked': true,
            },
            {
              'label': 'DUN',
              'checked': true,
            }
          ];
          break;
        case 'RUS':
          languageList = [
            {
              'label': 'KOK',
              'checked': true,
            },
            {
              'label': 'ENG',
              'checked': true,
            },
            {
              'label': 'RUR',
              'checked': true,
            },
            {
              'label': 'CZC',
              'checked': true,
            },
            {
              'label': 'PLP',
              'checked': true,
            },
            {
              'label': 'DAD',
              'checked': true,
            },
            {
              'label': 'FIF',
              'checked': true,
            },
            {
              'label': 'UKU',
              'checked': true,
            }
          ];
          break;
        case 'SEA':
          languageList = [
            {
              'label': 'KOK',
              'checked': true,
            },
            {
              'label': 'ENI',
              'checked': true,
            },
            {
              'label': 'IDI',
              'checked': true,
            }
          ];
          break;
        case 'CHN':
          languageList = [
            {
              'label': 'KOK',
              'checked': true,
            },
            {
              'label': 'MNC',
              'checked': true,
            },
            {
              'label': 'CAH',
              'checked': true,
            }
          ];
          break;
        case 'JPN':
          languageList = [
            {
              'label': 'KOK',
              'checked': true,
            },
            {
              'label': 'ENU',
              'checked': true,
            },
            {
              'label': 'JPJ',
              'checked': true,
            }
          ];
          break;
        default:
          languageList = [];
          break;
      }
    });
  }

  checkLanguages(List<Map<String, dynamic>> selLangObj) {
    setState(() {
      langs.addAll(selLangObj);
      print(langs);
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < countryList.length; i++)
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      countryList[i],
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: cvValue == countryList[i],
                      onChanged: (value) => {
                        if (value!)
                          {checkState(countryList[i])}
                        else
                          {checkState('none')}
                      },
                    ),
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
            for (int i = 0; i < languageList.length; i++)
              Column(
                children: [
                  Text(
                    languageList[i]['label'],
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: languageList[i]['checked'],
                    onChanged: (value) => {
                      if (value!)
                        {
                          checkLanguages([
                            {
                              "label": languageList[i]['label'],
                              "checked": true,
                            }
                          ])
                        }
                      else
                        {
                          checkLanguages([
                            {
                              "label": languageList[i]['label'],
                              "checked": false,
                            }
                          ])
                        }
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
                label: const Text('PARAMETER'),
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
                  print(selectedLangParam?.title);
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
                  "SET",
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
      ],
    );
  }
}
