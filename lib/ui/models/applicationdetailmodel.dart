class ApplicationDetailModel {
  var coeCasI20Recipt;
  var universityname;
  var transactedBy;
  var applied_for_other_university;
  var SpecifyConditionsForConditionalOffer;
  var offerStatus;
  var acknowledgementNumber;
  var acknowledgementFile;
  var submissionDate;
  var offerDate;
  var offerLapseDate;
  var conditionalOfferDate;
  var feeDeadline;
  var courseStartDate;
  var completionDate;
  var fullOfferDoc;
  var offerRejectReason;
  var rejectionDoc;
  var currencyCode;
  var conditionalOfferDoc;
  var totalfees;
  var totalfeesInr;
  var annualTutionFees;
  var annualTutionFeesInr;
  var oSHCFees;
  var acceptanceDate;
  var acceptanceStage;
  var paymentOption;
  var amountPaid;
  var dateOfPayment;
  var paidBy;
  var modeOfPayment;
  var balanceFee;
  var paymentReceipt;
  var coeRecevied;
  var coeLetter;
  var siecEmployee;
  var deferReason;
  var deferTill;
  var defermentStatus;
  var reasonOfWithdraw;
  var withdrawStatus;
  var cas_i_20_coe_doc;
  var countryName;
  var stageID;
  List<Documents>? documents;
  // List<AcknowledgementDocument>? acknowledgementDocument;
  // List<OfferDocument>? offerDocument;
  // List<FeeDocument>? feeDocument;

  ApplicationDetailModel({
    this.stageID,
    this.coeCasI20Recipt,
    this.countryName,
    this.universityname,
    this.transactedBy,
    this.applied_for_other_university,
    this.SpecifyConditionsForConditionalOffer,
    this.offerStatus,
    this.cas_i_20_coe_doc,
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
    this.withdrawStatus,
    this.documents,
    // this.acknowledgementDocument,
    // this.offerDocument,
    // this.feeDocument
  });

  ApplicationDetailModel.fromJson(Map<String, dynamic> json) {
    stageID = json["stageId"];
    countryName = json["country_name"];
    universityname = json["university_name"];
    cas_i_20_coe_doc = json["CAS_I20_COE_doc"];
    coeCasI20Recipt = json["coeCasI20Recipt"];
    transactedBy = json["transactedBy"];
    applied_for_other_university = json["applied_for_other_university"];
    SpecifyConditionsForConditionalOffer =
        json["SpecifyConditionsForConditionalOffer"];
    offerStatus = json['offer_status'];
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
    totalfees = json['totalfees'];
    totalfeesInr = json['totalfeesInr'];
    annualTutionFees = json['annualTutionFees'];
    annualTutionFeesInr = json['annualTutionFeesInr'];
    oSHCFees = json['OSHC_Fees'];
    acceptanceDate = json['acceptance_date'];
    acceptanceStage = json['acceptance_stage'];
    paymentOption = json['payment_option'];
    amountPaid = json['amount_paid'];
    dateOfPayment = json['date_of_payment'];
    paidBy = json['paidBy'];
    modeOfPayment = json['mode_of_payment'];
    balanceFee = json['balance_fee'];
    paymentReceipt = json['payment_receipt'];
    coeRecevied = json['coe_recevied'];
    coeLetter = json['coe_letter'];
    siecEmployee = json['siec_employee'];
    deferReason = json['defer_reason'];
    deferTill = json['defer_till'];
    defermentStatus = json['deferment_status'];
    reasonOfWithdraw = json['reason_of_withdraw'];
    withdrawStatus = json['withdraw_status'];
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
    // if (json['acknowledgement_document'] != null) {
    //   acknowledgementDocument = <AcknowledgementDocument>[];
    //   json['acknowledgement_document'].forEach((v) {
    //     acknowledgementDocument!.add(AcknowledgementDocument.fromJson(v));
    //   });
    // }
    // if (json['offer_document'] != null) {
    //   offerDocument = <OfferDocument>[];
    //   json['offer_document'].forEach((v) {
    //     offerDocument!.add(OfferDocument.fromJson(v));
    //   });
    // }
    // if (json['fee_document'] != null) {
    //   feeDocument = <FeeDocument>[];
    //   json['fee_document'].forEach((v) {
    //     feeDocument!.add(FeeDocument.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["stageId"] = stageID;
    data["university_name"] = universityname;
    data["country_name"] = countryName;
    data["CAS_I20_COE_doc"] = cas_i_20_coe_doc;
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
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    // if (acknowledgementDocument != null) {
    //   data['acknowledgement_document'] =
    //       acknowledgementDocument!.map((v) => v.toJson()).toList();
    // }
    // if (offerDocument != null) {
    //   data['offer_document'] = offerDocument!.map((v) => v.toJson()).toList();
    // }
    // if (feeDocument != null) {
    //   data['fee_document'] = feeDocument!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class OfferDocument {
  var documentName;
  var viewLink;
  var downloadLink;

  OfferDocument({this.documentName, this.viewLink, this.downloadLink});

  OfferDocument.fromJson(Map<String, dynamic> json) {
    documentName = json['document_name'];
    viewLink = json['view_link'];
    downloadLink = json['download_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['document_name'] = documentName;
    data['view_link'] = viewLink;
    data['download_link'] = downloadLink;
    return data;
  }
}

class FeeDocument {
  var documentName;
  var viewLink;
  var downloadLink;

  FeeDocument({this.documentName, this.viewLink, this.downloadLink});

  FeeDocument.fromJson(Map<String, dynamic> json) {
    documentName = json['document_name'];
    viewLink = json['view_link'];
    downloadLink = json['download_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['document_name'] = documentName;
    data['view_link'] = viewLink;
    data['download_link'] = downloadLink;
    return data;
  }
}

class AcknowledgementDocument {
  var documentName;
  var viewLink;
  var downloadLink;

  AcknowledgementDocument(
      {this.documentName, this.viewLink, this.downloadLink});

  AcknowledgementDocument.fromJson(Map<String, dynamic> json) {
    documentName = json['document_name'];
    viewLink = json['view_link'];
    downloadLink = json['download_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['document_name'] = documentName;
    data['view_link'] = viewLink;
    data['download_link'] = downloadLink;
    return data;
  }
}

class Documents {
  var id;
  var documentParentCategory;
  var requiredBy;
  var uploadedBy;
  var mandatoryStatus;
  var documentName;
  var viewLink;
  var downloadLink;

  Documents(
      {this.documentParentCategory,
      this.id,
      this.requiredBy,
      this.uploadedBy,
      this.mandatoryStatus,
      this.documentName,
      this.viewLink,
      this.downloadLink});

  Documents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    documentParentCategory = json['document_parent_category'];
    requiredBy = json['required_by'];
    uploadedBy = json['uploaded_by'];
    mandatoryStatus = json['mandatory_status'];
    documentName = json['document_name'];
    viewLink = json['view_link'];
    downloadLink = json['download_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['document_parent_category'] = documentParentCategory;
    data['required_by'] = requiredBy;
    data['uploaded_by'] = uploadedBy;
    data['mandatory_status'] = mandatoryStatus;
    data['document_name'] = documentName;
    data['view_link'] = viewLink;
    data['download_link'] = downloadLink;
    return data;
  }
}
