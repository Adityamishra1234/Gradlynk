class EnglishTestDetailsView {
  int? id;
  int? enqId;
  int? applicantType;
  String? examStatus;
  String? examType;
  String? testBook;
  String? dateOfExam;
  String? examName;
  String? tentativeExamDate;
  String? resultDate;
  String? expirationDate;
  int? reading;
  int? writing;
  int? listening;
  int? speaking;
  int? math;
  int? english;
  int? science;
  int? verbalReasoning;
  int? analyticalWriting;
  int? integratedReasoning;
  int? quantitativeApptitude;
  int? essay;
  double? overAll;
  int? isActive;
  int? createdBy;
  String? createdAt;
  int? updatedBy;
  String? updatedAt;
  String? assumptiveProficiency;
  String? scoreType;
  int? literacy;
  int? comprehension;
  int? conversation;
  int? production;

  EnglishTestDetailsView(
      {this.id,
      this.enqId,
      this.applicantType,
      this.examStatus,
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
      this.integratedReasoning,
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

  EnglishTestDetailsView.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enqId = json['enq_Id'];
    applicantType = json['applicant_type'];
    examStatus = json['exam_status'];
    examType = json['exam_type'];
    testBook = json['test_book'];
    dateOfExam = json['date_of_exam'];
    examName = json['exam_name'];
    tentativeExamDate = json['tentative_exam_date'];
    resultDate = json['result_date'];
    expirationDate = json['expiration_date'];
    reading = json['reading'];
    writing = json['writing'];
    listening = json['listening'];
    speaking = json['speaking'];
    math = json['math'];
    english = json['english'];
    science = json['science'];
    verbalReasoning = json['verbal_reasoning'];
    analyticalWriting = json['analytical_writing'];
    integratedReasoning = json['integrated_reasoning'];
    quantitativeApptitude = json['quantitative_apptitude'];
    essay = json['essay'];
    overAll = json['over_all'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    assumptiveProficiency = json['assumptive_proficiency'];
    scoreType = json['score_type'];
    literacy = json['literacy'];
    comprehension = json['comprehension'];
    conversation = json['conversation'];
    production = json['production'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['enq_Id'] = enqId;
    data['applicant_type'] = applicantType;
    data['exam_status'] = examStatus;
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
    data['integrated_reasoning'] = integratedReasoning;
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
