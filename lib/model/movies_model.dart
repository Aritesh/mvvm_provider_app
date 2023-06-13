class TipDataModel {
  String? status;
  List<Data>? data;
  String? message;

  TipDataModel({this.status, this.data, this.message});

  TipDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? type;
  String? tipType;
  String? marketId;
  String? buySell;
  String? target1;
  String? target2;
  String? target3;
  String? stopLoss;
  String? partialBooking;
  String? notExecuted;
  String? remark;
  String? tipDate;
  String? tipTime;
  String? target1Status;
  String? target2Status;
  String? target3Status;
  String? stopLossStatus;
  String? partialBookingStatus;
  String? notExecutedStatus;
  String? createdAt;
  String? tstatus;
  String? updatedAt;
  String? marketType;

  Data(
      {this.id,
      this.title,
      this.type,
      this.tipType,
      this.marketId,
      this.buySell,
      this.target1,
      this.target2,
      this.target3,
      this.stopLoss,
      this.partialBooking,
      this.notExecuted,
      this.remark,
      this.tipDate,
      this.tipTime,
      this.target1Status,
      this.target2Status,
      this.target3Status,
      this.stopLossStatus,
      this.partialBookingStatus,
      this.notExecutedStatus,
      this.createdAt,
      this.tstatus,
      this.updatedAt,
      this.marketType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    tipType = json['tip_type'];
    marketId = json['market_id'];
    buySell = json['buy_sell'];
    target1 = json['target1'];
    target2 = json['target2'];
    target3 = json['target3'];
    stopLoss = json['stop_loss'];
    partialBooking = json['partial_booking'];
    notExecuted = json['not_executed'];
    remark = json['remark'];
    tipDate = json['tip_date'];
    tipTime = json['tip_time'];
    target1Status = json['target1_status'];
    target2Status = json['target2_status'];
    target3Status = json['target3_status'];
    stopLossStatus = json['stop_loss_status'];
    partialBookingStatus = json['partial_booking_status'];
    notExecutedStatus = json['not_executed_status'];
    createdAt = json['created_at'];
    tstatus = json['tstatus'];
    updatedAt = json['updated_at'];
    marketType = json['market_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['tip_type'] = this.tipType;
    data['market_id'] = this.marketId;
    data['buy_sell'] = this.buySell;
    data['target1'] = this.target1;
    data['target2'] = this.target2;
    data['target3'] = this.target3;
    data['stop_loss'] = this.stopLoss;
    data['partial_booking'] = this.partialBooking;
    data['not_executed'] = this.notExecuted;
    data['remark'] = this.remark;
    data['tip_date'] = this.tipDate;
    data['tip_time'] = this.tipTime;
    data['target1_status'] = this.target1Status;
    data['target2_status'] = this.target2Status;
    data['target3_status'] = this.target3Status;
    data['stop_loss_status'] = this.stopLossStatus;
    data['partial_booking_status'] = this.partialBookingStatus;
    data['not_executed_status'] = this.notExecutedStatus;
    data['created_at'] = this.createdAt;
    data['tstatus'] = this.tstatus;
    data['updated_at'] = this.updatedAt;
    data['market_type'] = this.marketType;
    return data;
  }
}
