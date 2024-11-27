class PincodeResponse {
  final String message;
  final String status;
  final List<PostOffice> postOffices;

  PincodeResponse({required this.message, required this.status, required this.postOffices});

  factory PincodeResponse.fromJson(Map<String, dynamic> json) {
    var postOfficesJson = json['PostOffice'] as List;
    List<PostOffice> postOfficesList = postOfficesJson.map((i) => PostOffice.fromJson(i)).toList();

    return PincodeResponse(
      message: json['Message'],
      status: json['Status'],
      postOffices: postOfficesList,
    );
  }
}

class PostOffice {
  final String name;
  final String? description;
  final String branchType;
  final String deliveryStatus;
  final String circle;
  final String district;
  final String division;
  final String region;
  final String block;
  final String state;
  final String country;
  final String pincode;

  PostOffice({
    required this.name,
    this.description,
    required this.branchType,
    required this.deliveryStatus,
    required this.circle,
    required this.district,
    required this.division,
    required this.region,
    required this.block,
    required this.state,
    required this.country,
    required this.pincode,
  });

  factory PostOffice.fromJson(Map<String, dynamic> json) {
    return PostOffice(
      name: json['Name'],
      description: json['Description'],
      branchType: json['BranchType'],
      deliveryStatus: json['DeliveryStatus'],
      circle: json['Circle'],
      district: json['District'],
      division: json['Division'],
      region: json['Region'],
      block: json['Block'],
      state: json['State'],
      country: json['Country'],
      pincode: json['Pincode'],
    );
  }
}
