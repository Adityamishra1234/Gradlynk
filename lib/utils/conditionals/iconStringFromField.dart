getIconStringForFundParameter(String nameOftheField) {
  var iconString = '';
  switch (nameOftheField) {
    case 'Course fee':
      iconString = 'totalFees';
      break;
    case 'Living Expense':
      iconString = 'Living Expense';
      break;
    case 'Children Expense':
      iconString = 'Children Expense (18 Age)';
      break;
    case 'Children School Expense':
      iconString = 'University';
      break;
    case 'Children Expense (>18 Age)':
      iconString = 'Children Expense (18 Age)';
      break;
    case 'Total funds required (1 year)':
      iconString = 'totalFees';
      break;
    case 'Spouse Expense':
      iconString = 'Spouse Expense';
      break;

    case 'Family Insurance (Assumptive)':
      iconString = 'totalFees';
      break;
    case 'Travel expense':
      iconString = 'Annual Tuition Fees';
      break;
    case 'Total funds required (1 year)':
      iconString = 'totalFees';
      break;
    // case 'Total funds required (1 year)':
    //   iconString = 'assets/icons/totalFees.svg';
    //   break;
    default:
      iconString = 'totalFees';
  }

  return iconString;
}
