class Country {
  String? s13;
  String? s14;
  String? s38;
  String? s54;
  String? s56;
  String? s58;
  String? s68;
  String? s74;
  String? s75;
  String? s82;
  String? s99;
  String? s101;
  String? s105;
  String? s107;
  String? s109;
  String? s132;
  String? s135;
  String? s154;
  String? s157;
  String? s175;
  String? s181;
  String? s196;
  String? s198;
  String? s205;
  String? s212;
  String? s223;
  String? s229;
  String? s230;
  String? s231;

  Country(
      {this.s13,
      this.s14,
      this.s38,
      this.s54,
      this.s56,
      this.s58,
      this.s68,
      this.s74,
      this.s75,
      this.s82,
      this.s99,
      this.s101,
      this.s105,
      this.s107,
      this.s109,
      this.s132,
      this.s135,
      this.s154,
      this.s157,
      this.s175,
      this.s181,
      this.s196,
      this.s198,
      this.s205,
      this.s212,
      this.s223,
      this.s229,
      this.s230,
      this.s231});

  Country.fromJson(Map<String, dynamic> json) {
    s13 = json['13'];
    s14 = json['14'];
    s38 = json['38'];
    s54 = json['54'];
    s56 = json['56'];
    s58 = json['58'];
    s68 = json['68'];
    s74 = json['74'];
    s75 = json['75'];
    s82 = json['82'];
    s99 = json['99'];
    s101 = json['101'];
    s105 = json['105'];
    s107 = json['107'];
    s109 = json['109'];
    s132 = json['132'];
    s135 = json['135'];
    s154 = json['154'];
    s157 = json['157'];
    s175 = json['175'];
    s181 = json['181'];
    s196 = json['196'];
    s198 = json['198'];
    s205 = json['205'];
    s212 = json['212'];
    s223 = json['223'];
    s229 = json['229'];
    s230 = json['230'];
    s231 = json['231'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['13'] = this.s13;
    data['14'] = this.s14;
    data['38'] = this.s38;
    data['54'] = this.s54;
    data['56'] = this.s56;
    data['58'] = this.s58;
    data['68'] = this.s68;
    data['74'] = this.s74;
    data['75'] = this.s75;
    data['82'] = this.s82;
    data['99'] = this.s99;
    data['101'] = this.s101;
    data['105'] = this.s105;
    data['107'] = this.s107;
    data['109'] = this.s109;
    data['132'] = this.s132;
    data['135'] = this.s135;
    data['154'] = this.s154;
    data['157'] = this.s157;
    data['175'] = this.s175;
    data['181'] = this.s181;
    data['196'] = this.s196;
    data['198'] = this.s198;
    data['205'] = this.s205;
    data['212'] = this.s212;
    data['223'] = this.s223;
    data['229'] = this.s229;
    data['230'] = this.s230;
    data['231'] = this.s231;
    return data;
  }
}
