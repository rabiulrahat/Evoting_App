import 'dart:convert';


// String credentials = imagevalue;
void vase(credentials) {
  String encodedUrl = base64Url.encode(utf8.encode(credentials));
  print('encoded URL: $encodedUrl');
  // String ecoded = base64Url.encode(credentials); // dXNlcm5hbWU6cGFzc3dvcmQ=
  // print('$ecoded');
}

