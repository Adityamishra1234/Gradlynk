switchForMaximumScoreEnglishText(String selected) {
  switch (selected) {
    case 'IELTS':
      return 10;
    case 'PTE':
      return 90;
    case 'TOEFL':
      return 120;
    case 'Duolingo':
      return 160;
    case 'Cambridge':
      return 210;
    default:
  }
}