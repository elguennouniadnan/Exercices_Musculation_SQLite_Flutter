 class Exercise {
  int? ref;
  String? title;
  String? img;
  String? repeat;
  String? categorie;
  String? sets; //*
  String? duree; //*
  String? description;
  String? pause; //*
  int? favorite;

  Exercise(this.ref, this.title, this.img, this.repeat, this.categorie, this.sets, this.duree, this.description,
      this.pause, this.favorite);

  Map<String, dynamic> toJson() => {
        'ref': null,
        'title': title,
        'img': img,
        'repeat': repeat,
        'categorie': categorie,
        'sets': sets,
        'duree': duree,
        'description': description,
        'pause': pause,
        'favorite': favorite,
      };

  static Exercise fromJson(Map<String, dynamic> json) {
    return Exercise(
        json['ref'] as int,
        json['title'] as String,
        json['img'] as String,
        json['repeat'] as String,
        json['categorie'] as String,
        json['sets'] as String,
        json['duree'] as String,
        json['description'] as String,
        json['pause'] as String,
        json['favorite'] as int);
  }

  Map<String, dynamic> deObjetVersMap() {
    var map = <String, dynamic>{};
    if (ref != null) {
      map['ref'] = ref;
    }
    map['title'] = title;
    map['img'] = img;
    map['repeat'] = repeat;
    map['categorie'] = categorie;
    map['sets'] = sets;
    map['duree'] = duree;
    map['description'] = description;
    map['pause'] = pause;
    map['favorite'] = favorite;
    return map;
  }

  Exercise.deMapVersObjet(Map<String, dynamic> map) {
    ref = map['ref'];
    title = map['title'];
    img = map['img'];
    repeat = map['repeat'];
    categorie = map['categorie'];
    sets = map['sets'];
    duree = map['duree'];
    description = map['description'];
    pause = map['pause'];
    favorite = map['favorite'];
  }
}
