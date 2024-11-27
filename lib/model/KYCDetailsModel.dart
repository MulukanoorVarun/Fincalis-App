class KYCDetailsModel {
  Data? data;
  Settings? settings;

  KYCDetailsModel({this.data, this.settings});

  KYCDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    return data;
  }
}

class Data {
  Result? result;

  Data({this.result});

  Data.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  int? id;
  Null? aadhar;
  String? panImage;
  String? pan;
  String? aadharImage;
  String? dob;

  Result(
      {this.id,
        this.aadhar,
        this.panImage,
        this.pan,
        this.aadharImage,
        this.dob});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aadhar = json['aadhar'];
    panImage = json['pan_image'];
    pan = json['pan'];
    aadharImage = json['aadhar_image'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['aadhar'] = this.aadhar;
    data['pan_image'] = this.panImage;
    data['pan'] = this.pan;
    data['aadhar_image'] = this.aadharImage;
    data['dob'] = this.dob;
    return data;
  }
}

class Settings {
  String? message;
  int? status;
  int? success;

  Settings({this.message, this.status, this.success});

  Settings.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['success'] = this.success;
    return data;
  }
}
