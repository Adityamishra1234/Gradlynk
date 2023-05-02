class ConstantsWithId {
  static String getTypeofVisa(String typeofVisa) {
    if (typeofVisa == "1") {
      return "Student Visa";
    } else if (typeofVisa == "2") {
      return "Visitor Visa";
    } else if (typeofVisa == "3") {
      return "Tourist Visa";
    } else if (typeofVisa == "4") {
      return "Spouse Migration Visa";
    } else if (typeofVisa == "5") {
      return "Student Dependent Visa";
    } else {
      return "";
    }
  }

  static getApplicationType(String applicaaiontype) {
    if (applicaaiontype == "1") {
      return "Self";
    } else if (applicaaiontype == "2") {
      return "Spouse";
    } else if (applicaaiontype == "3") {
      return "Child";
    } else {
      return "";
    }
  }

  static getOfferStatus(String data) {
//       1= Awaiting Offer
// 2= Offer TAT Lapse

// 3= Conditional Offer Received

// 4 = Full Offer Received
// 5= Rejected From University
// 6 = Program Waitlisted

    if (data == "1") {
      return "Awaiting Offer";
    } else if (data == "2") {
      return "Offer TAT Lapse";
    } else if (data == "3") {
      return "Conditional Offer Received";
    } else if (data == "4") {
      return "Full Offer Received";
    } else if (data == "5") {
      return "Rejected From University";
    } else if (data == "6") {
      return "Program Waitlisted";
    } else {
      return "";
    }
  }

  static getPaymentMode(String data) {
    if (data == "1") {
      return "Cheque";
    } else if (data == "2") {
      return "Cash";
    } else if (data == "3") {
      return "IMPS";
    } else if (data == "4") {
      return "NEFT/RTGS";
    } else if (data == "5") {
      return "TT(Telegraphic Transfer)";
    } else if (data == "6") {
      return "Debit card";
    } else if (data == "7") {
      return "Credit card";
    } else {
      return "";
    }
  }

//   'paid_by' => [

//         1 => 'SIEC',

//         2 => 'Client'

//     ],

  static getPaymentOption(String data) {
    if (data == "1") {
      return "SIEC";
    } else if (data == "2") {
      return "Client";
    } else {
      return "";
    }
  }
}
