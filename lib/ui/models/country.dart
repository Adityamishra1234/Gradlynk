class Country {
  int? australia;
  int? austria;
  int? canada;
  int? croatia;
  int? cyprus;
  int? denmark;
  int? estonia;
  int? finland;
  int? france;
  int? germany;
  int? hungary;
  int? india;
  int? ireland;
  int? italy;
  int? japan;
  int? malaysia;
  int? malta;
  int? netherlands;
  int? newZealand;
  int? poland;
  int? russia;
  int? singapore;
  int? slovenia;
  int? spain;
  int? switzerland;
  int? turkey;
  int? uAE;
  int? uK;
  int? uSA;
  List<String>? countrylist;
  List<String>? codelist;

  Country(
      {this.australia,
      this.austria,
      this.canada,
      this.croatia,
      this.cyprus,
      this.denmark,
      this.estonia,
      this.finland,
      this.france,
      this.germany,
      this.hungary,
      this.india,
      this.ireland,
      this.italy,
      this.japan,
      this.malaysia,
      this.malta,
      this.netherlands,
      this.newZealand,
      this.poland,
      this.russia,
      this.singapore,
      this.slovenia,
      this.spain,
      this.switzerland,
      this.turkey,
      this.uAE,
      this.uK,
      this.uSA});

  Country.fromJson(Map<String, dynamic> json) {
    australia = json['Australia'];
    austria = json['Austria'];
    canada = json['Canada'];
    croatia = json['Croatia'];
    cyprus = json['Cyprus'];
    denmark = json['Denmark'];
    estonia = json['Estonia'];
    finland = json['Finland'];
    france = json['France'];
    germany = json['Germany'];
    hungary = json['Hungary'];
    india = json['India'];
    ireland = json['Ireland'];
    italy = json['Italy'];
    japan = json['Japan'];
    malaysia = json['Malaysia'];
    malta = json['Malta'];
    netherlands = json['Netherlands'];
    newZealand = json['New Zealand'];
    poland = json['Poland'];
    russia = json['Russia'];
    singapore = json['Singapore'];
    slovenia = json['Slovenia'];
    spain = json['Spain'];
    switzerland = json['Switzerland'];
    turkey = json['Turkey'];
    uAE = json['UAE'];
    uK = json['UK'];
    uSA = json['USA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Australia'] = this.australia;
    data['Austria'] = this.austria;
    data['Canada'] = this.canada;
    data['Croatia'] = this.croatia;
    data['Cyprus'] = this.cyprus;
    data['Denmark'] = this.denmark;
    data['Estonia'] = this.estonia;
    data['Finland'] = this.finland;
    data['France'] = this.france;
    data['Germany'] = this.germany;
    data['Hungary'] = this.hungary;
    data['India'] = this.india;
    data['Ireland'] = this.ireland;
    data['Italy'] = this.italy;
    data['Japan'] = this.japan;
    data['Malaysia'] = this.malaysia;
    data['Malta'] = this.malta;
    data['Netherlands'] = this.netherlands;
    data['New Zealand'] = this.newZealand;
    data['Poland'] = this.poland;
    data['Russia'] = this.russia;
    data['Singapore'] = this.singapore;
    data['Slovenia'] = this.slovenia;
    data['Spain'] = this.spain;
    data['Switzerland'] = this.switzerland;
    data['Turkey'] = this.turkey;
    data['UAE'] = this.uAE;
    data['UK'] = this.uK;
    data['USA'] = this.uSA;
    return data;
  }
}
