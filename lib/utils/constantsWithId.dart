class ConstantsWithId {
  static String getTypeofVisa(dynamic typeofVisa) {
    if (typeofVisa.toString() == "1") {
      return "Student Visa";
    } else if (typeofVisa.toString() == "2") {
      return "Visitor Visa";
    } else if (typeofVisa.toString() == "3") {
      return "Tourist Visa";
    } else if (typeofVisa.toString() == "4") {
      return "Spouse Migration Visa";
    } else if (typeofVisa.toString() == "5") {
      return "Student Dependent Visa";
    } else {
      return "";
    }
  }

  static getApplicationType(dynamic applicaaiontype) {
    if (applicaaiontype.toString() == "1") {
      return "Self";
    } else if (applicaaiontype.toString() == "2") {
      return "Spouse";
    } else if (applicaaiontype.toString() == "3") {
      return "Child";
    } else {
      return "";
    }
  }

  static getOfferStatus(dynamic data) {
//       1= Awaiting Offer
// 2= Offer TAT Lapse

// 3= Conditional Offer Received

// 4 = Full Offer Received
// 5= Rejected From University
// 6 = Program Waitlisted

    if (data.toString() == "1") {
      return "Awaiting Offer";
    } else if (data.toString() == "2") {
      return "Offer TAT Lapse";
    } else if (data.toString() == "3") {
      return "Conditional Offer Received";
    } else if (data.toString() == "4") {
      return "Full Offer Received";
    } else if (data.toString() == "5") {
      return "Rejected From University";
    } else if (data.toString() == "6") {
      return "Program Waitlisted";
    } else {
      return "";
    }
  }

  static getPaymentMode(dynamic data) {
    if (data.toString() == "1") {
      return "Cheque";
    } else if (data.toString() == "2") {
      return "Cash";
    } else if (data.toString() == "3") {
      return "IMPS";
    } else if (data.toString() == "4") {
      return "NEFT/RTGS";
    } else if (data.toString() == "5") {
      return "TT(Telegraphic Transfer)";
    } else if (data.toString() == "6") {
      return "Debit card";
    } else if (data.toString() == "7") {
      return "Credit card";
    } else {
      return "";
    }
  }

//   'paid_by' => [

//         1 => 'SIEC',

//         2 => 'Client'

//     ],

  static getPaymentOption(dynamic data) {
    if (data.toString() == "1") {
      return "SIEC";
    } else if (data.toString() == "2") {
      return "Client";
    } else {
      return "";
    }
  }
}
