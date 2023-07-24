String convertPlatform(String code) {
  String ret = '';
  switch (code) {
    case 'stdg5_mobis':
      ret = '표준형5세대 (STD G5)';
      break;
    case 'stdg5w_mobis':
      ret = '표준형5세대 와이드 (STD G5 W)';
      break;
    case 'stdg5_lge':
      ret = '표준형5세대 (STD G5)';
      break;
    case 'stdg5w_lge':
      ret = '표준형5세대 와이드 (STD G5 W)';
      break;
    case 'ccic':
      ret = 'CCIC (CCIC)';
      break;
    case 'prm5':
      ret = '고급형5세대 (PRM5)';
      break;
    case 'prm6':
      ret = '고급형6세대 (PRM6)';
      break;
    default:
      ret = 'none';
      break;
  }
  return ret;
}

String convertBuildMode(String code) {
  String ret = '';
  switch (code) {
    case 'dm':
      ret = 'DM Build';
      break;
    case 'lm':
      ret = 'LM Build';
      break;
    default:
      ret = 'Undefined';
      break;
  }
  return ret;
}
