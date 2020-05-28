
class GameDetail {
  int id;
  String name;
  String nameOriginal;
  String released;
  String updated;
  String backgroundImage;
  String backgroundImageAdditional;
  String website;
  double rating;
  int ratingTop;
  List<Ratings> ratings;
  int playtime;
  int achievementsCount;
  List<String> alternativeNames;
  List<Platforms> platforms;
  List<Stores> stores;
  List<Developers> developers;
  List<Publishers> genres;
  List<Publishers> publishers;
  Clip clip;
  String descriptionRaw;

  GameDetail(
      {this.id,
      this.name,
      this.nameOriginal,
      this.released,
      this.updated,
      this.backgroundImage,
      this.backgroundImageAdditional,
      this.website,
      this.rating,
      this.ratingTop,
      this.ratings,
      this.playtime,
      this.achievementsCount,
      this.alternativeNames,
      this.platforms,
      this.stores,
      this.developers,
      this.genres,
      this.publishers,
      this.clip,
      this.descriptionRaw});

  GameDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameOriginal = json['name_original'];
    released = json['released'];
    updated = json['updated'];
    backgroundImage = json['background_image'];
    backgroundImageAdditional = json['background_image_additional'];
    website = json['website'];
    rating = json['rating'];
    ratingTop = json['rating_top'];
    if (json['ratings'] != null) {
      ratings = new List<Ratings>();
      json['ratings'].forEach((v) {
        ratings.add(new Ratings.fromJson(v));
      });
    }
    playtime = json['playtime'];
    achievementsCount = json['achievements_count'];
    alternativeNames = json['alternative_names'].cast<String>();
    if (json['platforms'] != null) {
      platforms = new List<Platforms>();
      json['platforms'].forEach((v) {
        platforms.add(new Platforms.fromJson(v));
      });
    }
    if (json['stores'] != null) {
      stores = new List<Stores>();
      json['stores'].forEach((v) {
        stores.add(new Stores.fromJson(v));
      });
    }
    if (json['developers'] != null) {
      developers = new List<Developers>();
      json['developers'].forEach((v) {
        developers.add(new Developers.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = new List<Publishers>();
      json['genres'].forEach((v) {
        genres.add(new Publishers.fromJson(v));
      });
    }
    if (json['publishers'] != null) {
      publishers = new List<Publishers>();
      json['publishers'].forEach((v) {
        publishers.add(new Publishers.fromJson(v));
      });
    }
    clip = json['clip'] != null ? new Clip.fromJson(json['clip']) : null;
    descriptionRaw = json['description_raw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_original'] = this.nameOriginal;
    data['released'] = this.released;
    data['updated'] = this.updated;
    data['background_image'] = this.backgroundImage;
    data['background_image_additional'] = this.backgroundImageAdditional;
    data['website'] = this.website;
    data['rating'] = this.rating;
    data['rating_top'] = this.ratingTop;
    if (this.ratings != null) {
      data['ratings'] = this.ratings.map((v) => v.toJson()).toList();
    }
    data['playtime'] = this.playtime;
    data['achievements_count'] = this.achievementsCount;
    data['alternative_names'] = this.alternativeNames;
    if (this.platforms != null) {
      data['platforms'] = this.platforms.map((v) => v.toJson()).toList();
    }
    if (this.stores != null) {
      data['stores'] = this.stores.map((v) => v.toJson()).toList();
    }
    if (this.developers != null) {
      data['developers'] = this.developers.map((v) => v.toJson()).toList();
    }
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    if (this.publishers != null) {
      data['publishers'] = this.publishers.map((v) => v.toJson()).toList();
    }
    if (this.clip != null) {
      data['clip'] = this.clip.toJson();
    }
    data['description_raw'] = this.descriptionRaw;
    return data;
  }
}


class Ratings {
  int id;
  String title;
  int count;
  double percent;

  Ratings({this.id, this.title, this.count, this.percent});

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    count = json['count'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['count'] = this.count;
    data['percent'] = this.percent;
    return data;
  }
}

class Publishers {
  int id;
  String slug;
  String name;
  int gameCount;
  String imageBackground;

Publishers(
      {this.id,
      this.name,
      this.slug,
      this.gameCount,
      this.imageBackground});

  Publishers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    gameCount = json['games_count'];
    imageBackground = json['image_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['games_count'] = this.gameCount;
    data['image_background'] = this.imageBackground;
    return data;
  }
}


class Platform {
  int id;
  String name;
  String slug;

  Platform({this.id, this.name, this.slug});

  Platform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Platforms {
  MyPlatform platform;
  String releasedAt;
  Requirements requirements;

  Platforms({this.platform, this.releasedAt, this.requirements});

  Platforms.fromJson(Map<String, dynamic> json) {
    platform = json['platform'] != null
        ? new MyPlatform.fromJson(json['platform'])
        : null;
    releasedAt = json['released_at'];
    requirements = json['requirements'] != null
        ? new Requirements.fromJson(json['requirements'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.platform != null) {
      data['platform'] = this.platform.toJson();
    }
    data['released_at'] = this.releasedAt;
    if (this.requirements != null) {
      data['requirements'] = this.requirements.toJson();
    }
    return data;
  }
}

class MyPlatform {
  int id;
  String name;
  String slug;
  Null image;
  Null yearEnd;
  Null yearStart;
  int gamesCount;
  String imageBackground;

  MyPlatform(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.yearEnd,
      this.yearStart,
      this.gamesCount,
      this.imageBackground});

  MyPlatform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    yearEnd = json['year_end'];
    yearStart = json['year_start'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['year_end'] = this.yearEnd;
    data['year_start'] = this.yearStart;
    data['games_count'] = this.gamesCount;
    data['image_background'] = this.imageBackground;
    return data;
  }
}

class Requirements {
  String minimum;
  String recommended;

  Requirements({this.minimum, this.recommended});

  Requirements.fromJson(Map<String, dynamic> json) {
    minimum = json['minimum'];
    recommended = json['recommended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minimum'] = this.minimum;
    data['recommended'] = this.recommended;
    return data;
  }
}

class Stores {
  int id;
  String url;
  Store store;

  Stores({this.id, this.url, this.store});

  Stores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    if (this.store != null) {
      data['store'] = this.store.toJson();
    }
    return data;
  }
}

class Store {
  int id;
  String name;
  String slug;
  String domain;
  int gamesCount;
  String imageBackground;

  Store(
      {this.id,
      this.name,
      this.slug,
      this.domain,
      this.gamesCount,
      this.imageBackground});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    domain = json['domain'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['domain'] = this.domain;
    data['games_count'] = this.gamesCount;
    data['image_background'] = this.imageBackground;
    return data;
  }
}

class Developers {
  int id;
  String name;
  String slug;
  int gamesCount;
  String imageBackground;

  Developers(
      {this.id, this.name, this.slug, this.gamesCount, this.imageBackground});

  Developers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['games_count'] = this.gamesCount;
    data['image_background'] = this.imageBackground;
    return data;
  }
}

class Clip {
  String clip;
  Clips clips;
  String video;
  String preview;

  Clip({this.clip, this.clips, this.video, this.preview});

  Clip.fromJson(Map<String, dynamic> json) {
    clip = json['clip'];
    clips = json['clips'] != null ? new Clips.fromJson(json['clips']) : null;
    video = json['video'];
    preview = json['preview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clip'] = this.clip;
    if (this.clips != null) {
      data['clips'] = this.clips.toJson();
    }
    data['video'] = this.video;
    data['preview'] = this.preview;
    return data;
  }
}

class Clips {
  String s320;
  String s640;
  String full;

  Clips({this.s320, this.s640, this.full});

  Clips.fromJson(Map<String, dynamic> json) {
    s320 = json['320'];
    s640 = json['640'];
    full = json['full'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['320'] = this.s320;
    data['640'] = this.s640;
    data['full'] = this.full;
    return data;
  }
}
