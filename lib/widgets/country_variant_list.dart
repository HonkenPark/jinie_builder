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
  Map<String, dynamic> langs = {};
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
  Map<String, bool> languageList = {
    "KOK": false,
    "ENU": false,
    "FRC": false,
    "SPM": false,
    "ENG": false,
    "FRF": false,
    "GED": false,
    "DUN": false,
    "ITI": false,
    "SPE": false,
    "RUR": false,
    "CZC": false,
    "DAD": false,
    "PLP": false,
    "PTP": false,
    "SWS": false,
    "TRT": false,
    "NON": false,
    "FIF": false,
    "GRG": false,
    "BGB": false,
    "ENA": false,
    "HRH": false,
    "HUH": false,
    "ROR": false,
    "SKS": false,
    "SLS": false,
    "UKU": false,
    "ENI": false,
    "JPJ": false,
    "IDI": false,
    "MNC": false,
    "CAH": false
  };

  @override
  void initState() {
    theme = widget.theme;
    userInfo = widget.userInfo;
    super.initState();
  }

  Color getColor(Set<MaterialState> states) => getCheckboxColor(states, theme);

  checkCountryVariant(String cv) {
    setState(() {
      cvValue = cv;
      switch (cv) {
        case 'KOR':
          languageList = {
            'KOK': true,
            'ENU': true,
          };
          break;
        case 'NA':
          languageList = {
            'KOK': true,
            'ENU': true,
            'FRC': true,
            'SPM': true,
          };
          break;
        case 'EUR':
          languageList = {
            'KOK': true,
            'ENG': true,
            'FRF': true,
            'SPE': true,
            'GED': true,
            'DUN': true,
          };
          break;
        case 'RUS':
          languageList = {
            'KOK': true,
            'ENG': true,
            'RUR': true,
            'CZC': true,
            'PLP': true,
            'DAD': true,
            'FIF': true,
            'UKU': true,
          };
        case 'SEA':
          languageList = {
            'KOK': true,
            'ENI': true,
            'IDI': true,
          };
          break;
        case 'CHN':
          languageList = {
            'KOK': true,
            'MNC': true,
            'CAH': true,
          };
          break;
        case 'JPN':
          languageList = {
            'KOK': true,
            'ENU': true,
            'JPJ': true,
          };
          break;
        default:
          languageList = {};
          break;
      }
    });
  }

  checkLanguages(String key, bool value) {
    setState(() {
      languageList.addAll({key: value});
    });
  }

  applyLangParam(String param, Map<String, bool> langs) {
    setState(() {
      userInfo.langs[param].addAll(langs);
      print(userInfo.langs);
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
                          {checkCountryVariant(countryList[i])}
                        else
                          {checkCountryVariant('none')}
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
                  applyLangParam(selectedLangParam!.title, languageList);
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
      ],
    );
  }
}
