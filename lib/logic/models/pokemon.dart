class Pokemon {
  int id;
  String name;
  Sprites sprites;

  Pokemon({this.id, this.name, this.sprites});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sprites =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.sprites != null) {
      data['sprites'] = this.sprites.toJson();
    }
    return data;
  }
}

class Sprites {
  String frontDefault;

  Sprites({this.frontDefault});

  Sprites.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    return data;
  }
}
