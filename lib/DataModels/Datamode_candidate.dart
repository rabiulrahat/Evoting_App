// To parse this JSON data, do
//
//     final candidateList = candidateListFromJson(jsonString);

import 'dart:convert';

CandidateList candidateListFromJson(String str) =>
    CandidateList.fromJson(json.decode(str));

String candidateListToJson(CandidateList data) => json.encode(data.toJson());

class CandidateList {
  CandidateList({
    required this.applicableCandidate,
    required this.digest,
    required this.signature,
  });

  List<String> applicableCandidate;
  String digest;
  String signature;

  factory CandidateList.fromJson(Map<String, dynamic> json) => CandidateList(
        applicableCandidate:
            List<String>.from(json["applicable_candidate"].map((x) => x)),
        digest: json["Digest"],
        signature: json["Signature"],
      );

  Map<String, dynamic> toJson() => {
        "applicable_candidate":
            List<dynamic>.from(applicableCandidate.map((x) => x)),
        "Digest": digest,
        "Signature": signature,
      };
}
