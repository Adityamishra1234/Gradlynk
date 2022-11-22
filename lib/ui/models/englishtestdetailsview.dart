class EnglishTestDetailsViewModel {
  String? id;
  String? enqId;
  String? applicantType;
  String? examStatusID;
  String? examType;
  String? testBook;
  String? dateOfExam;
  String? examName;
  String? tentativeExamDate;
  String? resultDate;
  String? expirationDate;
  String? reading;
  String? writing;
  String? listening;
  String? speaking;
  String? math;
  String? english;
  String? science;
  String? verbalReasoning;
  String? analyticalWriting;
  String? StringegratedReasoning;
  String? quantitativeApptitude;
  String? essay;
  String? overAll;
  String? isActive;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? assumptiveProficiency;
  String? scoreType;
  String? literacy;
  String? comprehension;
  String? conversation;
  String? production;

  EnglishTestDetailsViewModel(
      {this.id,
      this.enqId,
      this.applicantType,
      this.examStatusID,
      this.examType,
      this.testBook,
      this.dateOfExam,
      this.examName,
      this.tentativeExamDate,
      this.resultDate,
      this.expirationDate,
      this.reading,
      this.writing,
      this.listening,
      this.speaking,
      this.math,
      this.english,
      this.science,
      this.verbalReasoning,
      this.analyticalWriting,
      this.StringegratedReasoning,
      this.quantitativeApptitude,
      this.essay,
      this.overAll,
      this.isActive,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.assumptiveProficiency,
      this.scoreType,
      this.literacy,
      this.comprehension,
      this.conversation,
      this.production});

  EnglishTestDetailsViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    enqId = json['enq_Id'].toString();
    applicantType = json['applicant_type'].toString();
    examStatusID = json['exam_status'].toString();
    examType = json['exam_type'].toString();
    testBook = json['test_book'].toString();
    dateOfExam = json['date_of_exam'].toString();
    examName = json['exam_name'].toString();
    tentativeExamDate = json['tentative_exam_date'].toString();
    resultDate = json['result_date'].toString();
    expirationDate = json['expiration_date'].toString();
    reading = json['reading'].toString();
    writing = json['writing'].toString();
    listening = json['listening'].toString();
    speaking = json['speaking'].toString();
    math = json['math'].toString();
    english = json['english'].toString();
    science = json['science'].toString();
    verbalReasoning = json['verbal_reasoning'].toString();
    analyticalWriting = json['analytical_writing'].toString();
    StringegratedReasoning = json['Stringegrated_reasoning'].toString();
    quantitativeApptitude = json['quantitative_apptitude'].toString();
    essay = json['essay'].toString();
    overAll = json['over_all'].toString();
    isActive = json['is_active'].toString();
    createdBy = json['created_by'].toString();
    createdAt = json['created_at'].toString();
    updatedBy = json['updated_by'].toString();
    updatedAt = json['updated_at'].toString();
    assumptiveProficiency = json['assumptive_proficiency'].toString();
    scoreType = json['score_type'].toString();
    literacy = json['literacy'].toString();
    comprehension = json['comprehension'].toString();
    conversation = json['conversation'].toString();
    production = json['production'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['enq_Id'] = enqId;
    data['applicant_type'] = applicantType;
    data['exam_status'] = examStatusID;
    data['exam_type'] = examType;
    data['test_book'] = testBook;
    data['date_of_exam'] = dateOfExam;
    data['exam_name'] = examName;
    data['tentative_exam_date'] = tentativeExamDate;
    data['result_date'] = resultDate;
    data['expiration_date'] = expirationDate;
    data['reading'] = reading;
    data['writing'] = writing;
    data['listening'] = listening;
    data['speaking'] = speaking;
    data['math'] = math;
    data['english'] = english;
    data['science'] = science;
    data['verbal_reasoning'] = verbalReasoning;
    data['analytical_writing'] = analyticalWriting;
    data['Stringegrated_reasoning'] = StringegratedReasoning;
    data['quantitative_apptitude'] = quantitativeApptitude;
    data['essay'] = essay;
    data['over_all'] = overAll;
    data['is_active'] = isActive;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_by'] = updatedBy;
    data['updated_at'] = updatedAt;
    data['assumptive_proficiency'] = assumptiveProficiency;
    data['score_type'] = scoreType;
    data['literacy'] = literacy;
    data['comprehension'] = comprehension;
    data['conversation'] = conversation;
    data['production'] = production;
    return data;
  }
}
