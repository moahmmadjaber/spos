class HomeModel {
  String? sTARTDATE;
  int? beneficentID;
  int? beneficentNO;
  String? mobile;
  String? countryNAME;
  String? branchNAME;
  int? totalPERSON;
  String? benfSTATUS;
  int? paidAMOUNTS;
  String? stopDATE;
  int? noTYPEHASHD;
  int? noTYPERENT;
  int? noTYPEWIDOW;
  int? totalAMOUNT;
  String? officeNAME;
  int? benfSTATUSID;
  int? notREQUIREDACCOUNT;
  int? noTYPEELECTRICITY;
  String? beneficentname;
  int? noTYPEARROGANT;
  int? noTYPEFOUNDATIONWARRANTY;
  int? noTYPEMUTAFAWIQIN;
  int? noTYPEMEDICINE;
  int? noTYPEAHTIAJAT;
  int? noTYPEFAMILYAMOUNT;
  int? noTYPENORMAL;
  String? beneficentOLDNO;
  int? requiredACCOUNT;
  String? governementNAME;
  int? totalNOOTHERTYPEAMOUNT;
  int? totalPERSONAMOUNT;
  int? totalNOOTHERTYPE;

  HomeModel(
      {this.sTARTDATE,
        this.beneficentID,
        this.beneficentNO,
        this.mobile,
        this.countryNAME,
        this.branchNAME,
        this.totalPERSON,
        this.benfSTATUS,
        this.paidAMOUNTS,
        this.stopDATE,
        this.noTYPEHASHD,
        this.noTYPERENT,
        this.noTYPEWIDOW,
        this.totalAMOUNT,
        this.officeNAME,
        this.benfSTATUSID,
        this.notREQUIREDACCOUNT,
        this.noTYPEELECTRICITY,
        this.beneficentname,
        this.noTYPEARROGANT,
        this.noTYPEFOUNDATIONWARRANTY,
        this.noTYPEMUTAFAWIQIN,
        this.noTYPEMEDICINE,
        this.noTYPEAHTIAJAT,
        this.noTYPEFAMILYAMOUNT,
        this.noTYPENORMAL,
        this.beneficentOLDNO,
        this.requiredACCOUNT,
        this.governementNAME,
        this.totalNOOTHERTYPEAMOUNT,
        this.totalPERSONAMOUNT,
        this.totalNOOTHERTYPE});

  HomeModel.fromJson(Map<String, dynamic> json) {
    sTARTDATE = json['START_DATE'];
    beneficentID = json['beneficent_ID'];
    beneficentNO = json['beneficent_NO'];
    mobile = json['mobile'];
    countryNAME = json['country_NAME'];
    branchNAME = json['branch_NAME'];
    totalPERSON = json['total_PERSON'];
    benfSTATUS = json['benf_STATUS'];
    paidAMOUNTS = json['paid_AMOUNTS'];
    stopDATE = json['stop_DATE'];
    noTYPEHASHD = json['no_TYPE_HASHD'];
    noTYPERENT = json['no_TYPE_RENT'];
    noTYPEWIDOW = json['no_TYPE_WIDOW'];
    totalAMOUNT = json['total_AMOUNT'];
    officeNAME = json['office_NAME'];
    benfSTATUSID = json['benf_STATUS_ID'];
    notREQUIREDACCOUNT = json['not_REQUIRED_ACCOUNT'];
    noTYPEELECTRICITY = json['no_TYPE_ELECTRICITY'];
    beneficentname = json['beneficentname'];
    noTYPEARROGANT = json['no_TYPE_ARROGANT'];
    noTYPEFOUNDATIONWARRANTY = json['no_TYPE_FOUNDATION_WARRANTY'];
    noTYPEMUTAFAWIQIN = json['no_TYPE_MUTAFAWIQIN'];
    noTYPEMEDICINE = json['no_TYPE_MEDICINE'];
    noTYPEAHTIAJAT = json['no_TYPE_AHTIAJAT'];
    noTYPEFAMILYAMOUNT = json['no_TYPE_FAMILY_AMOUNT'];
    noTYPENORMAL = json['no_TYPE_NORMAL'];
    beneficentOLDNO = json['beneficent_OLD_NO'];
    requiredACCOUNT = json['required_ACCOUNT'];
    governementNAME = json['governement_NAME'];
    totalNOOTHERTYPEAMOUNT = json['total_NO_OTHER_TYPE_AMOUNT'];
    totalPERSONAMOUNT = json['total_PERSON_AMOUNT'];
    totalNOOTHERTYPE = json['total_NO_OTHER_TYPE'];
  }

}