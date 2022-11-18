class OtherTestDetailsViewModel {
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
  int? overAll;
  int? isActive;
  int? createdBy;
  String? createdAt;
  int? updatedBy;
  String? updatedAt;
  int? assumptiveProficiency;
  String? scoreType;
  int? literacy;
  int? comprehension;
  int? conversation;
  int? production;

  OtherTestDetailsViewModel(
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

  OtherTestDetailsViewModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['enq_Id'] = this.enqId;
    data['applicant_type'] = this.applicantType;
    data['exam_status'] = this.examStatus;
    data['exam_type'] = this.examType;
    data['test_book'] = this.testBook;
    data['date_of_exam'] = this.dateOfExam;
    data['exam_name'] = this.examName;
    data['tentative_exam_date'] = this.tentativeExamDate;
    data['result_date'] = this.resultDate;
    data['expiration_date'] = this.expirationDate;
    data['reading'] = this.reading;
    data['writing'] = this.writing;
    data['listening'] = this.listening;
    data['speaking'] = this.speaking;
    data['math'] = this.math;
    data['english'] = this.english;
    data['science'] = this.science;
    data['verbal_reasoning'] = this.verbalReasoning;
    data['analytical_writing'] = this.analyticalWriting;
    data['integrated_reasoning'] = this.integratedReasoning;
    data['quantitative_apptitude'] = this.quantitativeApptitude;
    data['essay'] = this.essay;
    data['over_all'] = this.overAll;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    data['assumptive_proficiency'] = this.assumptiveProficiency;
    data['score_type'] = this.scoreType;
    data['literacy'] = this.literacy;
    data['comprehension'] = this.comprehension;
    data['conversation'] = this.conversation;
    data['production'] = this.production;
    return data;
  }
}
