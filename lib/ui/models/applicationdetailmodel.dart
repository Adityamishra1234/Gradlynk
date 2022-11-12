class ApplicationDetailModel {
  String? offerStatus;
  String? acknowledgementNumber;
  String? acknowledgementFile;
  String? submissionDate;
  String? offerDate;
  String? offerLapseDate;
  String? conditionalOfferDate;
  String? feeDeadline;
  String? courseStartDate;
  String? completionDate;
  String? fullOfferDoc;
  String? offerRejectReason;
  String? rejectionDoc;
  String? currencyCode;
  String? conditionalOfferDoc;
  String? totalfees;
  String? totalfeesInr;
  String? annualTutionFees;
  String? annualTutionFeesInr;
  String? oSHCFees;
  String? acceptanceDate;
  String? acceptanceStage;
  String? paymentOption;
  String? amountPaid;
  String? dateOfPayment;
  String? paidBy;
  String? modeOfPayment;
  String? balanceFee;
  String? paymentReceipt;
  String? coeRecevied;
  String? coeLetter;
  String? siecEmployee;
  String? deferReason;
  String? deferTill;
  String? defermentStatus;
  String? reasonOfWithdraw;
  String? withdrawStatus;

  ApplicationDetailModel(
      {this.offerStatus,
      this.acknowledgementNumber,
      this.acknowledgementFile,
      this.submissionDate,
      this.offerDate,
      this.offerLapseDate,
      this.conditionalOfferDate,
      this.feeDeadline,
      this.courseStartDate,
      this.completionDate,
      this.fullOfferDoc,
      this.offerRejectReason,
      this.rejectionDoc,
      this.currencyCode,
      this.conditionalOfferDoc,
      this.totalfees,
      this.totalfeesInr,
      this.annualTutionFees,
      this.annualTutionFeesInr,
      this.oSHCFees,
      this.acceptanceDate,
      this.acceptanceStage,
      this.paymentOption,
      this.amountPaid,
      this.dateOfPayment,
      this.paidBy,
      this.modeOfPayment,
      this.balanceFee,
      this.paymentReceipt,
      this.coeRecevied,
      this.coeLetter,
      this.siecEmployee,
      this.deferReason,
      this.deferTill,
      this.defermentStatus,
      this.reasonOfWithdraw,
      this.withdrawStatus});

  ApplicationDetailModel.fromJson(Map<String, dynamic> json) {
    offerStatus = json['offer_status'].toString();
    acknowledgementNumber = json['acknowledgement_number'];
    acknowledgementFile = json['acknowledgement_file'];
    submissionDate = json['submission_date'];
    offerDate = json['offer_date'];
    offerLapseDate = json['offer_lapse_date'];
    conditionalOfferDate = json['conditional_offer_date'];
    feeDeadline = json['fee_deadline'];
    courseStartDate = json['course_start_date'];
    completionDate = json['completion_date'];
    fullOfferDoc = json['full_offer_doc'];
    offerRejectReason = json['offer_reject_reason'];
    rejectionDoc = json['rejection_doc'];
    currencyCode = json['currencyCode'];
    conditionalOfferDoc = json['conditional_offer_doc'];
    totalfees = json['totalfees'].toString();
    totalfeesInr = json['totalfeesInr'].toString();
    annualTutionFees = json['annualTutionFees'].toString();
    annualTutionFeesInr = json['annualTutionFeesInr'].toString();
    oSHCFees = json['OSHC_Fees'].toString();
    acceptanceDate = json['acceptance_date'].toString();
    acceptanceStage = json['acceptance_stage'];
    paymentOption = json['payment_option'].toString();
    amountPaid = json['amount_paid'].toString();
    dateOfPayment = json['date_of_payment'].toString();
    paidBy = json['paidBy'].toString();
    modeOfPayment = json['mode_of_payment'].toString();
    balanceFee = json['balance_fee'].toString();
    paymentReceipt = json['payment_receipt'];
    coeRecevied = json['coe_recevied'].toString();
    coeLetter = json['coe_letter'];
    siecEmployee = json['siec_employee'];
    deferReason = json['defer_reason'];
    deferTill = json['defer_till'];
    defermentStatus = json['deferment_status'];
    reasonOfWithdraw = json['reason_of_withdraw'];
    withdrawStatus = json['withdraw_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['offer_status'] = offerStatus;
    data['acknowledgement_number'] = acknowledgementNumber;
    data['acknowledgement_file'] = acknowledgementFile;
    data['submission_date'] = submissionDate;
    data['offer_date'] = offerDate;
    data['offer_lapse_date'] = offerLapseDate;
    data['conditional_offer_date'] = conditionalOfferDate;
    data['fee_deadline'] = feeDeadline;
    data['course_start_date'] = courseStartDate;
    data['completion_date'] = completionDate;
    data['full_offer_doc'] = fullOfferDoc;
    data['offer_reject_reason'] = offerRejectReason;
    data['rejection_doc'] = rejectionDoc;
    data['currencyCode'] = currencyCode;
    data['conditional_offer_doc'] = conditionalOfferDoc;
    data['totalfees'] = totalfees;
    data['totalfeesInr'] = totalfeesInr;
    data['annualTutionFees'] = annualTutionFees;
    data['annualTutionFeesInr'] = annualTutionFeesInr;
    data['OSHC_Fees'] = oSHCFees;
    data['acceptance_date'] = acceptanceDate;
    data['acceptance_stage'] = acceptanceStage;
    data['payment_option'] = paymentOption;
    data['amount_paid'] = amountPaid;
    data['date_of_payment'] = dateOfPayment;
    data['paidBy'] = paidBy;
    data['mode_of_payment'] = modeOfPayment;
    data['balance_fee'] = balanceFee;
    data['payment_receipt'] = paymentReceipt;
    data['coe_recevied'] = coeRecevied;
    data['coe_letter'] = coeLetter;
    data['siec_employee'] = siecEmployee;
    data['defer_reason'] = deferReason;
    data['defer_till'] = deferTill;
    data['deferment_status'] = defermentStatus;
    data['reason_of_withdraw'] = reasonOfWithdraw;
    data['withdraw_status'] = withdrawStatus;
    return data;
  }
}
