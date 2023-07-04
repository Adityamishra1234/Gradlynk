class BifurcatedRelation {
  String? father;
  String? mother;
  String? paternalUncle;
  String? maternalUncle;
  String? paternalAunt;
  String? maternalAunt;
  String? sister;
  String? brother;
  String? spouse;
  String? paternalGrandFather;
  String? maternalGrandFather;
  String? paternalGrandMother;
  String? maternalGrandMother;
  String? fatherInLaw;
  String? motherInLaw;

  BifurcatedRelation(
      {this.father,
      this.mother,
      this.paternalUncle,
      this.maternalUncle,
      this.paternalAunt,
      this.maternalAunt,
      this.sister,
      this.brother,
      this.spouse,
      this.paternalGrandFather,
      this.maternalGrandFather,
      this.paternalGrandMother,
      this.maternalGrandMother,
      this.fatherInLaw,
      this.motherInLaw});

  BifurcatedRelation.fromJson(Map<String, dynamic> json) {
    father = json['Father'];
    mother = json['Mother'];
    paternalUncle = json['Paternal Uncle'];
    maternalUncle = json['Maternal Uncle'];
    paternalAunt = json['Paternal Aunt'];
    maternalAunt = json['Maternal Aunt'];
    sister = json['Sister'];
    brother = json['Brother'];
    spouse = json['Spouse'];
    paternalGrandFather = json['Paternal Grand-Father'];
    maternalGrandFather = json['Maternal Grand-Father'];
    paternalGrandMother = json['Paternal Grand-Mother'];
    maternalGrandMother = json['Maternal Grand-Mother'];
    fatherInLaw = json['Father-in-law'];
    motherInLaw = json['Mother-in-law'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Father'] = father;
    data['Mother'] = mother;
    data['Paternal Uncle'] = paternalUncle;
    data['Maternal Uncle'] = maternalUncle;
    data['Paternal Aunt'] = paternalAunt;
    data['Maternal Aunt'] = maternalAunt;
    data['Sister'] = sister;
    data['Brother'] = brother;
    data['Spouse'] = spouse;
    data['Paternal Grand-Father'] = paternalGrandFather;
    data['Maternal Grand-Father'] = maternalGrandFather;
    data['Paternal Grand-Mother'] = paternalGrandMother;
    data['Maternal Grand-Mother'] = maternalGrandMother;
    data['Father-in-law'] = fatherInLaw;
    data['Mother-in-law'] = motherInLaw;
    return data;
  }
}
