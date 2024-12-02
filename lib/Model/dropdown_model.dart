class DropdownModel {
  int? ack;
  String? ackMsg;
  List<DropdownModelResult>? result;

  DropdownModel({this.ack, this.ackMsg, this.result});

  DropdownModel.fromJson(Map<String, dynamic> json) {
    ack = json['ack'];
    ackMsg = json['ack_msg'];
    if (json['result'] != null) {
      result = <DropdownModelResult>[];
      json['result'].forEach((v) {
        result!.add(new DropdownModelResult.fromJson(v));
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

class DropdownModelResult {
  String? id;
  String? statusTypeFlag;
  String? name;
  String? displayOrder;
  String? colorCode;
  String? isDelete;
  String? isActive;
  String? createdDate;
  String? createdBy;
  String? createdByType;
  String? modifiedDate;
  String? modifiedBy;
  String? modifiedByType;
  String? createdByOfficeId;

  DropdownModelResult(
      {this.id,
        this.statusTypeFlag,
        this.name,
        this.displayOrder,
        this.colorCode,
        this.isDelete,
        this.isActive,
        this.createdDate,
        this.createdBy,
        this.createdByType,
        this.modifiedDate,
        this.modifiedBy,
        this.modifiedByType,
        this.createdByOfficeId});

  DropdownModelResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusTypeFlag = json['status_type_flag'];
    name = json['name'];
    displayOrder = json['display_order'];
    colorCode = json['color_code'];
    isDelete = json['isDelete'];
    isActive = json['isActive'];
    createdDate = json['created_date'];
    createdBy = json['created_by'];
    createdByType = json['created_by_type'];
    modifiedDate = json['modified_date'];
    modifiedBy = json['modified_by'];
    modifiedByType = json['modified_by_type'];
    createdByOfficeId = json['created_by_office_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status_type_flag'] = this.statusTypeFlag;
    data['name'] = this.name;
    data['display_order'] = this.displayOrder;
    data['color_code'] = this.colorCode;
    data['isDelete'] = this.isDelete;
    data['isActive'] = this.isActive;
    data['created_date'] = this.createdDate;
    data['created_by'] = this.createdBy;
    data['created_by_type'] = this.createdByType;
    data['modified_date'] = this.modifiedDate;
    data['modified_by'] = this.modifiedBy;
    data['modified_by_type'] = this.modifiedByType;
    data['created_by_office_id'] = this.createdByOfficeId;
    return data;
  }
}
