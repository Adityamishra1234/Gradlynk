getIconStringForFundParameter(String nameOftheField) {
  var iconString = '';
  switch (nameOftheField) {
    case 'Course fee':
      iconString = 'assets/icons/totalFees.svg';
      break;
    case 'Living Expense':
      iconString = 'assets/icons/Living Expense.svg';
      break;
    case 'Children Expense':
      iconString = 'assets/icons/totalFees.svg';
      break;
    case 'Children School Expense':
      iconString = 'assets/icons/totalFees.svg';
      break;
    case 'Children Expense (>18 Age)':
      iconString = 'assets/icons/totalFees.svg';
      break;
    case 'Total funds required (1 year)':
      iconString = 'assets/icons/totalFees.svg';
      break;
    case 'Spouse Expense':
      iconString = 'assets/icons/totalFees.svg';
      break;

    case 'Family Insurance (Assumptive)':
      iconString = 'assets/icons/totalFees.svg';
      break;
    case 'Travel expense':
      iconString = 'assets/icons/totalFees.svg';
      break;
    case 'Total funds required (1 year)':
      iconString = 'assets/icons/totalFees.svg';
      break;
    // case 'Total funds required (1 year)':
    //   iconString = 'assets/icons/totalFees.svg';
    //   break;
    default:
      iconString = 'assets/icons/totalFees.svg';
  }

  return iconString;
}
