class HomeModel {
  int? ack;
  String? ackMsg;
  List<Result>? result;

  HomeModel({this.ack, this.ackMsg, this.result});

  HomeModel.fromJson(Map<String, dynamic> json) {
    ack = json['ack'];
    ackMsg = json['ack_msg'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ack'] = this.ack;
    data['ack_msg'] = this.ackMsg;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? id;
  String? projectStatus;
  String? projectNo;
  String? projectSignupType;
  String? quoteId;
  String? quoteType;
  String? userId;
  String? leadId;
  String? cpId;
  String? createdDate;
  String? entryFlag;
  String? userName;
  String? quoteNo;
  String? customerName;
  String? customerPhone;
  String? projectTypeId;
  String? projectTypeName;
  String? noOfPanel;
  String? kw;
  String? projectStatusId;
  String? projectStatusColor;
  String? partATotal;
  String? structureCharge;
  String? installationCharge;
  String? marginCommissionCharge;
  String? companyMargin;
  String? stateSubsidy;
  String? mnreSubsidy;
  String? grnadTotal;
  String? discountAmt;
  String? projectTypeImage;
  String? panelBrandImage;
  String? invertorBrandImage;
  String? projectPiImage;

  Result(
      {this.id,
        this.projectStatus,
        this.projectNo,
        this.projectSignupType,
        this.quoteId,
        this.quoteType,
        this.userId,
        this.leadId,
        this.cpId,
        this.createdDate,
        this.entryFlag,
        this.userName,
        this.quoteNo,
        this.customerName,
        this.customerPhone,
        this.projectTypeId,
        this.projectTypeName,
        this.noOfPanel,
        this.kw,
        this.projectStatusId,
        this.projectStatusColor,
        this.partATotal,
        this.structureCharge,
        this.installationCharge,
        this.marginCommissionCharge,
        this.companyMargin,
        this.stateSubsidy,
        this.mnreSubsidy,
        this.grnadTotal,
        this.discountAmt,
        this.projectTypeImage,
        this.panelBrandImage,
        this.invertorBrandImage,
        this.projectPiImage});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectStatus = json['project_status'];
    projectNo = json['project_no'];
    projectSignupType = json['project_signup_type'];
    quoteId = json['quote_id'];
    quoteType = json['quote_type'];
    userId = json['user_id'];
    leadId = json['lead_id'];
    cpId = json['cp_id'];
    createdDate = json['created_date'];
    entryFlag = json['entry_flag'];
    userName = json['user_name'];
    quoteNo = json['quote_no'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    projectTypeId = json['project_type_id'];
    projectTypeName = json['project_type_name'];
    noOfPanel = json['no_of_panel'];
    kw = json['kw'];
    projectStatusId = json['project_status_id'];
    projectStatusColor = json['project_status_color'];
    partATotal = json['part_a_total'];
    structureCharge = json['structure_charge'];
    installationCharge = json['installation_charge'];
    marginCommissionCharge = json['margin_commission_charge'];
    companyMargin = json['company_margin'];
    stateSubsidy = json['state_subsidy'];
    mnreSubsidy = json['mnre_subsidy'];
    grnadTotal = json['grnad_total'];
    discountAmt = json['discount_amt'];
    projectTypeImage = json['project_type_image'];
    panelBrandImage = json['panel_brand_image'];
    invertorBrandImage = json['invertor_brand_image'];
    projectPiImage = json['project_pi_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_status'] = this.projectStatus;
    data['project_no'] = this.projectNo;
    data['project_signup_type'] = this.projectSignupType;
    data['quote_id'] = this.quoteId;
    data['quote_type'] = this.quoteType;
    data['user_id'] = this.userId;
    data['lead_id'] = this.leadId;
    data['cp_id'] = this.cpId;
    data['created_date'] = this.createdDate;
    data['entry_flag'] = this.entryFlag;
    data['user_name'] = this.userName;
    data['quote_no'] = this.quoteNo;
    data['customer_name'] = this.customerName;
    data['customer_phone'] = this.customerPhone;
    data['project_type_id'] = this.projectTypeId;
    data['project_type_name'] = this.projectTypeName;
    data['no_of_panel'] = this.noOfPanel;
    data['kw'] = this.kw;
    data['project_status_id'] = this.projectStatusId;
    data['project_status_color'] = this.projectStatusColor;
    data['part_a_total'] = this.partATotal;
    data['structure_charge'] = this.structureCharge;
    data['installation_charge'] = this.installationCharge;
    data['margin_commission_charge'] = this.marginCommissionCharge;
    data['company_margin'] = this.companyMargin;
    data['state_subsidy'] = this.stateSubsidy;
    data['mnre_subsidy'] = this.mnreSubsidy;
    data['grnad_total'] = this.grnadTotal;
    data['discount_amt'] = this.discountAmt;
    data['project_type_image'] = this.projectTypeImage;
    data['panel_brand_image'] = this.panelBrandImage;
    data['invertor_brand_image'] = this.invertorBrandImage;
    data['project_pi_image'] = this.projectPiImage;
    return data;
  }
}
