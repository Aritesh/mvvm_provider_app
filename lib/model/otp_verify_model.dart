class OTPVerifyModel {
  String? status;
  String? message;
  int? id;
  List<Data>? data;
  String? alreadyExistMsg;

  OTPVerifyModel(
      {this.status, this.message, this.id, this.data, this.alreadyExistMsg});

  OTPVerifyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    id = json['id'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    alreadyExistMsg = json['already_exist_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['id'] = this.id;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['already_exist_msg'] = this.alreadyExistMsg;
    return data;
  }
}

class Data {
  String? id;
  String? role;
  String? name;
  String? email;
  String? mobile;
  String? password;
  String? planId;
  String? cityId;
  String? remark;
  String? status;
  String? deleteStatus;
  String? otp;
  String? deviceToken;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.role,
      this.name,
      this.email,
      this.mobile,
      this.password,
      this.planId,
      this.cityId,
      this.remark,
      this.status,
      this.deleteStatus,
      this.otp,
      this.deviceToken,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    password = json['password'];
    planId = json['plan_id'];
    cityId = json['city_id'];
    remark = json['remark'];
    status = json['status'];
    deleteStatus = json['delete_status'];
    otp = json['otp'];
    deviceToken = json['device_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['plan_id'] = this.planId;
    data['city_id'] = this.cityId;
    data['remark'] = this.remark;
    data['status'] = this.status;
    data['delete_status'] = this.deleteStatus;
    data['otp'] = this.otp;
    data['device_token'] = this.deviceToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
