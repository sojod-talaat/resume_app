class User {
  int? _id;
  String? _username;
  String? _password;
  User(this._username, this._password);
  User.fromMap(dynamic obj) {
    this._username = obj['username'];
    this._password = obj['password'];
  }
  String get username => _username ?? 'sojod';
  String get password => _password ?? 'sojod78900';
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;
    return map;
  }
}
