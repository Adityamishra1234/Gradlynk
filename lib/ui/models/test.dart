class ApplicationDetails {
  int? offerStatus;
  String? acknowledgementNumber;
  Null? acknowledgementFile;
  String? submissionDate;
  String? offerDate;
  String? offerLapseDate;
  String? conditionalOfferDate;
  String? feeDeadline;
  String? courseStartDate;
  String? completionDate;
  String? fullOfferDoc;
  String? offerRejectReason;
  Null? rejectionDoc;
  String? currencyCode;
  String? conditionalOfferDoc;
  Null? totalfees;
  int? totalfeesInr;
  int? annualTutionFees;
  int? annualTutionFeesInr;
  String? oSHCFees;
  Null? acceptanceDate;
  Null? acceptanceStage;
  int? paymentOption;
  String? amountPaid;
  String? dateOfPayment;
  String? paidBy;
  int? modeOfPayment;
  String? balanceFee;
  String? paymentReceipt;
  int? coeRecevied;
  Null? coeLetter;
  Null? siecEmployee;
  Null? deferReason;
  Null? deferTill;
  Null? defermentStatus;
  Null? reasonOfWithdraw;
  Null? withdrawStatus;
  Documents? documents;

  ApplicationDetails(
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
      this.withdrawStatus,
      this.documents});

  ApplicationDetails.fromJson(Map<String, dynamic> json) {
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
    documents = json['documents'] != null
        ? new Documents.fromJson(json['documents'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offer_status'] = this.offerStatus;
    data['acknowledgement_number'] = this.acknowledgementNumber;
    data['acknowledgement_file'] = this.acknowledgementFile;
    data['submission_date'] = this.submissionDate;
    data['offer_date'] = this.offerDate;
    data['offer_lapse_date'] = this.offerLapseDate;
    data['conditional_offer_date'] = this.conditionalOfferDate;
    data['fee_deadline'] = this.feeDeadline;
    data['course_start_date'] = this.courseStartDate;
    data['completion_date'] = this.completionDate;
    data['full_offer_doc'] = this.fullOfferDoc;
    data['offer_reject_reason'] = this.offerRejectReason;
    data['rejection_doc'] = this.rejectionDoc;
    data['currencyCode'] = this.currencyCode;
    data['conditional_offer_doc'] = this.conditionalOfferDoc;
    data['totalfees'] = this.totalfees;
    data['totalfeesInr'] = this.totalfeesInr;
    data['annualTutionFees'] = this.annualTutionFees;
    data['annualTutionFeesInr'] = this.annualTutionFeesInr;
    data['OSHC_Fees'] = this.oSHCFees;
    data['acceptance_date'] = this.acceptanceDate;
    data['acceptance_stage'] = this.acceptanceStage;
    data['payment_option'] = this.paymentOption;
    data['amount_paid'] = this.amountPaid;
    data['date_of_payment'] = this.dateOfPayment;
    data['paidBy'] = this.paidBy;
    data['mode_of_payment'] = this.modeOfPayment;
    data['balance_fee'] = this.balanceFee;
    data['payment_receipt'] = this.paymentReceipt;
    data['coe_recevied'] = this.coeRecevied;
    data['coe_letter'] = this.coeLetter;
    data['siec_employee'] = this.siecEmployee;
    data['defer_reason'] = this.deferReason;
    data['defer_till'] = this.deferTill;
    data['deferment_status'] = this.defermentStatus;
    data['reason_of_withdraw'] = this.reasonOfWithdraw;
    data['withdraw_status'] = this.withdrawStatus;
    if (this.documents != null) {
      data['documents'] = this.documents!.toJson();
    }
    return data;
  }
}

class Documents {
  List<IdentityProofs>? identityProofs;
  List<AcademicDocuments>? academicDocuments;
  List<FamilyDocuments>? familyDocuments;
  List<Offer>? offer;
  List<Fee>? fee;

  Documents(
      {this.identityProofs,
      this.academicDocuments,
      this.familyDocuments,
      this.offer,
      this.fee});

  Documents.fromJson(Map<String, dynamic> json) {
    if (json['Identity Proofs'] != null) {
      identityProofs = <IdentityProofs>[];
      json['Identity Proofs'].forEach((v) {
        identityProofs!.add(new IdentityProofs.fromJson(v));
      });
    }
    if (json['Academic Documents'] != null) {
      academicDocuments = <AcademicDocuments>[];
      json['Academic Documents'].forEach((v) {
        academicDocuments!.add(new AcademicDocuments.fromJson(v));
      });
    }
    if (json['Family Documents'] != null) {
      familyDocuments = <FamilyDocuments>[];
      json['Family Documents'].forEach((v) {
        familyDocuments!.add(new FamilyDocuments.fromJson(v));
      });
    }
    if (json['offer'] != null) {
      offer = <Offer>[];
      json['offer'].forEach((v) {
        offer!.add(new Offer.fromJson(v));
      });
    }
    if (json['fee'] != null) {
      fee = <Fee>[];
      json['fee'].forEach((v) {
        fee!.add(new Fee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.identityProofs != null) {
      data['Identity Proofs'] =
          this.identityProofs!.map((v) => v.toJson()).toList();
    }
    if (this.academicDocuments != null) {
      data['Academic Documents'] =
          this.academicDocuments!.map((v) => v.toJson()).toList();
    }
    if (this.familyDocuments != null) {
      data['Family Documents'] =
          this.familyDocuments!.map((v) => v.toJson()).toList();
    }
    if (this.offer != null) {
      data['offer'] = this.offer!.map((v) => v.toJson()).toList();
    }
    if (this.fee != null) {
      data['fee'] = this.fee!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IdentityProofs {
  String? documentName;
  String? viewLink;
  String? downloadLink;

  IdentityProofs({this.documentName, this.viewLink, this.downloadLink});

  IdentityProofs.fromJson(Map<String, dynamic> json) {
    documentName = json['document_name'];
    viewLink = json['view_link'];
    downloadLink = json['download_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['document_name'] = this.documentName;
    data['view_link'] = this.viewLink;
    data['download_link'] = this.downloadLink;
    return data;
  }
}

class AcademicDocuments {
  String? documentName;
  String? viewLink;
  String? downloadLink;

  AcademicDocuments({this.documentName, this.viewLink, this.downloadLink});

  AcademicDocuments.fromJson(Map<String, dynamic> json) {
    documentName = json['document_name'];
    viewLink = json['view_link'];
    downloadLink = json['download_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['document_name'] = this.documentName;
    data['view_link'] = this.viewLink;
    data['download_link'] = this.downloadLink;
    return data;
  }
}

class FamilyDocuments {
  String? documentName;
  String? viewLink;
  String? downloadLink;

  FamilyDocuments({this.documentName, this.viewLink, this.downloadLink});

  FamilyDocuments.fromJson(Map<String, dynamic> json) {
    documentName = json['document_name'];
    viewLink = json['view_link'];
    downloadLink = json['download_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['document_name'] = this.documentName;
    data['view_link'] = this.viewLink;
    data['download_link'] = this.downloadLink;
    return data;
  }
}

class Offer {
  String? documentName;
  String? viewLink;
  String? downloadLink;

  Offer({this.documentName, this.viewLink, this.downloadLink});

  Offer.fromJson(Map<String, dynamic> json) {
    documentName = json['document_name'];
    viewLink = json['view_link'];
    downloadLink = json['download_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['document_name'] = this.documentName;
    data['view_link'] = this.viewLink;
    data['download_link'] = this.downloadLink;
    return data;
  }
}

class Fee {
  String? documentName;
  String? viewLink;
  String? downloadLink;

  Fee({this.documentName, this.viewLink, this.downloadLink});

  Fee.fromJson(Map<String, dynamic> json) {
    documentName = json['document_name'];
    viewLink = json['view_link'];
    downloadLink = json['download_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['document_name'] = this.documentName;
    data['view_link'] = this.viewLink;
    data['download_link'] = this.downloadLink;
    return data;
  }
}
