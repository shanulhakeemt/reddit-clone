class SampleModel{
  String? name;
  String? age;
  String? uid;

//<editor-fold desc="Data Methods">
  SampleModel({
    this.name,
    this.age,
    this.uid,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SampleModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age &&
          uid == other.uid);

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ uid.hashCode;

  @override
  String toString() {
    return 'SampleModel{' +
        ' name: $name,' +
        ' age: $age,' +
        ' uid: $uid,' +
        '}';
  }

  SampleModel copyWith({
    String? name,
    String? age,
    String? uid,
  }) {
    return SampleModel(
      name: name ?? this.name,
      age: age ?? this.age,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'age': this.age,
      'uid': this.uid,
    };
  }

  factory SampleModel.fromMap(Map<String, dynamic> map) {
    return SampleModel(
      name: map['name'] as String,
      age: map['age'] as String,
      uid: map['uid'] as String,
    );
  }

//</editor-fold>
}