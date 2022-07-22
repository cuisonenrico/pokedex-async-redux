class TestList {
  List<Type> types = [];
  String id = '';

  TestList({required this.types, required this.id});

  TestList.fromJson(Map<String, dynamic> json) {
    // print(json);
    id = json['id'].toString();
    types = List<Type>.from(json['types'].map((x) => Type.fromJson(x)));
  }
}

class Type {
  int? slot = 0;
  SubType types = SubType(name: '', url: '');
  Type({required this.types, required this.slot});

  Type.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    types = SubType.fromJson(json['type']);
  }
}

class SubType {
  String? name = '';
  String? url = '';
  SubType({required this.name, required this.url});

  SubType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
