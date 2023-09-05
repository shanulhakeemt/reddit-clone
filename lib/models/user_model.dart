class UserModel {
  final String name;
  final String profilePic;
  final String uid;
  final String banner;
  final bool isAuthenticated;
  final int karma;
  final List<String> awards;

//<editor-fold desc="Data Methods">
  const UserModel({
    required this.name,
    required this.profilePic,
    required this.uid,
    required this.banner,
    required this.isAuthenticated,
    required this.karma,
    required this.awards,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          profilePic == other.profilePic &&
          uid == other.uid &&
          banner == other.banner &&
          isAuthenticated == other.isAuthenticated &&
          karma == other.karma &&
          awards == other.awards);

  @override
  int get hashCode =>
      name.hashCode ^
      profilePic.hashCode ^
      uid.hashCode ^
      banner.hashCode ^
      isAuthenticated.hashCode ^
      karma.hashCode ^
      awards.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' name: $name,' +
        ' profilePic: $profilePic,' +
        ' uid: $uid,' +
        ' banner: $banner,' +
        ' isAuthenticated: $isAuthenticated,' +
        ' karma: $karma,' +
        ' awards: $awards,' +
        '}';
  }

  UserModel copyWith({
    String? name,
    String? profilePic,
    String? uid,
    String? banner,
    bool? isAuthenticated,
    int? karma,
    List<String>? awards,
  }) {
    return UserModel(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      uid: uid ?? this.uid,
      banner: banner ?? this.banner,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      karma: karma ?? this.karma,
      awards: awards ?? this.awards,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'profilePic': this.profilePic,
      'uid': this.uid,
      'banner': this.banner,
      'isAuthenticated': this.isAuthenticated,
      'karma': this.karma,
      'awards': this.awards,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      profilePic: map['profilePic'] ?? '',
      uid: map['uid'] ?? '',
      banner: map['banner'] ?? '',
      isAuthenticated: map['isAuthenticated'] ?? false,
      karma: map['karma'] ?? 0,
      awards: List<String>.from(map['awards']),
    );
  }

//</editor-fold>
}
