// // To parse this JSON data, do
// //
// //     final voterInfo = voterInfoFromJson(jsonString);

// import 'dart:convert';

// VoterInfo voterInfoFromJson(String str) => VoterInfo.fromJson(json.decode(str));

// String voterInfoToJson(VoterInfo data) => json.encode(data.toJson());

// class VoterInfo {
//   VoterInfo({
//     required this.profile,
//     required this.nid,
//     required this.name,
//     required this.pscode,
//     required this.address,
//     required this.profileDigest,
//     required this.digest,
//     required this.sign,
//   });

//   Profile profile;
//   String nid;
//   String name;
//   String pscode;
//   Address address;
//   String profileDigest;
//   String digest;
//   String sign;

//   factory VoterInfo.fromJson(Map<String, dynamic> json) => VoterInfo(
//         profile: Profile.fromJson(json["Profile"]),
//         nid: json["NID"],
//         name: json["Name"],
//         pscode: json["PSCODE"],
//         address: Address.fromJson(json["Address"]),
//         profileDigest: json["Profile_Digest"],
//         digest: json["Digest"],
//         sign: json["SIGN"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Profile": profile.toJson(),
//         "NID": nid,
//         "Name": name,
//         "PSCODE": pscode,
//         "Address": address.toJson(),
//         "Profile_Digest": profileDigest,
//         "Digest": digest,
//         "SIGN": sign,
//       };
// }

// class Address {
//   Address({
//     required this.union,
//     required this.thana,
//     required this.district,
//     required this.po,
//   });

//   String union;
//   String thana;
//   String district;
//   String po;

//   factory Address.fromJson(Map<String, dynamic> json) => Address(
//         union: json["Union"],
//         thana: json["Thana"],
//         district: json["District"],
//         po: json["PO"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Union": union,
//         "Thana": thana,
//         "District": district,
//         "PO": po,
//       };
// }

// class Profile {
//   Profile({
//     required this.filename,
//     required this.header,
//     required this.size,
//   });

//   String filename;
//   Header header;
//   int size;

//   factory Profile.fromJson(Map<String, dynamic> json) => Profile(
//         filename: json["Filename"],
//         header: Header.fromJson(json["Header"]),
//         size: json["Size"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Filename": filename,
//         "Header": header.toJson(),
//         "Size": size,
//       };
// }

// class Header {
//   Header({
//     required this.contentDisposition,
//     required this.contentType,
//   });

//   List<String> contentDisposition;
//   List<String> contentType;

//   factory Header.fromJson(Map<String, dynamic> json) => Header(
//         contentDisposition:
//             List<String>.from(json["Content-Disposition"].map((x) => x)),
//         contentType: List<String>.from(json["Content-Type"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "Content-Disposition":
//             List<dynamic>.from(contentDisposition.map((x) => x)),
//         "Content-Type": List<dynamic>.from(contentType.map((x) => x)),
//       };
// }

// To parse this JSON data, do
//
//     final voterInfo = voterInfoFromJson(jsonString);

import 'dart:convert';

VoterInfo voterInfoFromJson(String str) => VoterInfo.fromJson(json.decode(str));

String voterInfoToJson(VoterInfo data) => json.encode(data.toJson());

class VoterInfo {
  VoterInfo({
    required this.profile,
    required this.nid,
    required this.name,
    required this.pscode,
    required this.address,
    required this.loc,
    required this.profileDigest,
    required this.digest,
    required this.sign,
  });

  Profile profile;
  String nid;
  String name;
  String pscode;
  Address address;
  String loc;
  String profileDigest;
  String digest;
  String sign;

  factory VoterInfo.fromJson(Map<String, dynamic> json) => VoterInfo(
        profile: Profile.fromJson(json["Profile"]),
        nid: json["NID"],
        name: json["Name"],
        pscode: json["PSCODE"],
        address: Address.fromJson(json["Address"]),
        loc: json["LOC"],
        profileDigest: json["Profile_Digest"],
        digest: json["Digest"],
        sign: json["SIGN"],
      );

  Map<String, dynamic> toJson() => {
        "Profile": profile.toJson(),
        "NID": nid,
        "Name": name,
        "PSCODE": pscode,
        "Address": address.toJson(),
        "LOC": loc,
        "Profile_Digest": profileDigest,
        "Digest": digest,
        "SIGN": sign,
      };

  void clear() {}
}

class Address {
  Address({
    required this.union,
    required this.thana,
    required this.district,
    required this.po,
  });

  String union;
  String thana;
  String district;
  String po;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        union: json["Union"],
        thana: json["Thana"],
        district: json["District"],
        po: json["PO"],
      );

  Map<String, dynamic> toJson() => {
        "Union": union,
        "Thana": thana,
        "District": district,
        "PO": po,
      };
}

class Profile {
  Profile({
    required this.filename,
    required this.header,
    required this.size,
  });

  String filename;
  Header header;
  int size;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        filename: json["Filename"],
        header: Header.fromJson(json["Header"]),
        size: json["Size"],
      );

  Map<String, dynamic> toJson() => {
        "Filename": filename,
        "Header": header.toJson(),
        "Size": size,
      };
}

class Header {
  Header({
    required this.contentDisposition,
    required this.contentType,
  });

  List<String> contentDisposition;
  List<String> contentType;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        contentDisposition:
            List<String>.from(json["Content-Disposition"].map((x) => x)),
        contentType: List<String>.from(json["Content-Type"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Content-Disposition":
            List<dynamic>.from(contentDisposition.map((x) => x)),
        "Content-Type": List<dynamic>.from(contentType.map((x) => x)),
      };
}
