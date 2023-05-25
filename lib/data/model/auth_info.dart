class AuthInfo {
 final  String accessToken;
 final String refreshToken;

  AuthInfo({required this.accessToken,required this.refreshToken});

  AuthInfo.fromJson(Map<String, dynamic> json):
    accessToken = json['accessToken'],
    refreshToken = json['refreshToken'];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}