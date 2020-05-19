class GameModel {
  int count;
  String next;
  String previous;
  List<Results> results;
  String seoTitle;
  String seoDescription;
  String seoKeywords;
  String seoH1;
  bool noindex;
  bool nofollow;
  String description;
  Filters filters;
  List<String> nofollowCollections;

  GameModel(
      {this.count,
      this.next,
      this.previous,
      this.results,
      this.seoTitle,
      this.seoDescription,
      this.seoKeywords,
      this.seoH1,
      this.noindex,
      this.nofollow,
      this.description,
      this.filters,
      this.nofollowCollections});

  GameModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    seoKeywords = json['seo_keywords'];
    seoH1 = json['seo_h1'];
    noindex = json['noindex'];
    nofollow = json['nofollow'];
    description = json['description'];
    filters =
        json['filters'] != null ? new Filters.fromJson(json['filters']) : null;
    nofollowCollections = json['nofollow_collections'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['seo_keywords'] = this.seoKeywords;
    data['seo_h1'] = this.seoH1;
    data['noindex'] = this.noindex;
    data['nofollow'] = this.nofollow;
    data['description'] = this.description;
    if (this.filters != null) {
      data['filters'] = this.filters.toJson();
    }
    data['nofollow_collections'] = this.nofollowCollections;
    return data;
  }
}

class Results {
  int id;
  String slug;
  String name;
  String released;
  bool tba;
  String backgroundImage;
  double rating;
  int ratingTop;
  List<Ratings> ratings;
  int ratingsCount;
  int reviewsTextCount;
  int added;
  AddedByStatus addedByStatus;
  int metacritic;
  int playtime;
  int suggestionsCount;
  Null userGame;
  int reviewsCount;
  String saturatedColor;
  String dominantColor;
  List<PlatformsModel> platforms;
  List<ParentPlatforms> parentPlatforms;
  List<Genres> genres;
  List<Stores> stores;
  Clip clip;
  List<ShortScreenshots> shortScreenshots;

  Results(
      {this.id,
      this.slug,
      this.name,
      this.released,
      this.tba,
      this.backgroundImage,
      this.rating,
      this.ratingTop,
      this.ratings,
      this.ratingsCount,
      this.reviewsTextCount,
      this.added,
      this.addedByStatus,
      this.metacritic,
      this.playtime,
      this.suggestionsCount,
      this.userGame,
      this.reviewsCount,
      this.saturatedColor,
      this.dominantColor,
      this.platforms,
      this.parentPlatforms,
      this.genres,
      this.stores,
      this.clip,
      this.shortScreenshots});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    released = json['released'];
    tba = json['tba'];
    backgroundImage = json['background_image'];
    rating = json['rating'];
    ratingTop = json['rating_top'];
    if (json['ratings'] != null) {
      ratings = new List<Ratings>();
      json['ratings'].forEach((v) {
        ratings.add(new Ratings.fromJson(v));
      });
    }
    ratingsCount = json['ratings_count'];
    reviewsTextCount = json['reviews_text_count'];
    added = json['added'];
    addedByStatus = json['added_by_status'] != null
        ? new AddedByStatus.fromJson(json['added_by_status'])
        : null;
    metacritic = json['metacritic'];
    playtime = json['playtime'];
    suggestionsCount = json['suggestions_count'];
    userGame = json['user_game'];
    reviewsCount = json['reviews_count'];
    saturatedColor = json['saturated_color'];
    dominantColor = json['dominant_color'];
    if (json['platforms'] != null) {
      platforms = new List<PlatformsModel>();
      json['platforms'].forEach((v) {
        platforms.add(new PlatformsModel.fromJson(v));
      });
    }
    if (json['parent_platforms'] != null) {
      parentPlatforms = new List<ParentPlatforms>();
      json['parent_platforms'].forEach((v) {
        parentPlatforms.add(new ParentPlatforms.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }
    if (json['stores'] != null) {
      stores = new List<Stores>();
      json['stores'].forEach((v) {
        stores.add(new Stores.fromJson(v));
      });
    }
    clip = json['clip'] != null ? new Clip.fromJson(json['clip']) : null;
    if (json['short_screenshots'] != null) {
      shortScreenshots = new List<ShortScreenshots>();
      json['short_screenshots'].forEach((v) {
        shortScreenshots.add(new ShortScreenshots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['released'] = this.released;
    data['tba'] = this.tba;
    data['background_image'] = this.backgroundImage;
    data['rating'] = this.rating;
    data['rating_top'] = this.ratingTop;
    if (this.ratings != null) {
      data['ratings'] = this.ratings.map((v) => v.toJson()).toList();
    }
    data['ratings_count'] = this.ratingsCount;
    data['reviews_text_count'] = this.reviewsTextCount;
    data['added'] = this.added;
    if (this.addedByStatus != null) {
      data['added_by_status'] = this.addedByStatus.toJson();
    }
    data['metacritic'] = this.metacritic;
    data['playtime'] = this.playtime;
    data['suggestions_count'] = this.suggestionsCount;
    data['user_game'] = this.userGame;
    data['reviews_count'] = this.reviewsCount;
    data['saturated_color'] = this.saturatedColor;
    data['dominant_color'] = this.dominantColor;
    if (this.platforms != null) {
      data['platforms'] = this.platforms.map((v) => v.toJson()).toList();
    }
    if (this.parentPlatforms != null) {
      data['parent_platforms'] =
          this.parentPlatforms.map((v) => v.toJson()).toList();
    }
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    if (this.stores != null) {
      data['stores'] = this.stores.map((v) => v.toJson()).toList();
    }
    if (this.clip != null) {
      data['clip'] = this.clip.toJson();
    }
    if (this.shortScreenshots != null) {
      data['short_screenshots'] =
          this.shortScreenshots.map((v) => v.toJson()).toList();
    }
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

class AddedByStatus {
  int yet;
  int owned;
  int beaten;
  int toplay;
  int dropped;
  int playing;

  AddedByStatus(
      {this.yet,
      this.owned,
      this.beaten,
      this.toplay,
      this.dropped,
      this.playing});

  AddedByStatus.fromJson(Map<String, dynamic> json) {
    yet = json['yet'];
    owned = json['owned'];
    beaten = json['beaten'];
    toplay = json['toplay'];
    dropped = json['dropped'];
    playing = json['playing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yet'] = this.yet;
    data['owned'] = this.owned;
    data['beaten'] = this.beaten;
    data['toplay'] = this.toplay;
    data['dropped'] = this.dropped;
    data['playing'] = this.playing;
    return data;
  }
}

class PlatformsModel {
  Platform platform;
  String releasedAt;
  RequirementsEn requirementsEn;
  RequirementsEn requirementsRu;

  PlatformsModel(
      {this.platform,
      this.releasedAt,
      this.requirementsEn,
      this.requirementsRu});

  PlatformsModel.fromJson(Map<String, dynamic> json) {
    platform = json['platform'] != null
        ? new Platform.fromJson(json['platform'])
        : null;
    releasedAt = json['released_at'];
    requirementsEn = json['requirements_en'] != null
        ? new RequirementsEn.fromJson(json['requirements_en'])
        : null;
    requirementsRu = json['requirements_ru'] != null
        ? new RequirementsEn.fromJson(json['requirements_ru'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.platform != null) {
      data['platform'] = this.platform.toJson();
    }
    data['released_at'] = this.releasedAt;
    if (this.requirementsEn != null) {
      data['requirements_en'] = this.requirementsEn.toJson();
    }
    if (this.requirementsRu != null) {
      data['requirements_ru'] = this.requirementsRu.toJson();
    }
    return data;
  }
}

class Platform {
  int id;
  String name;
  String slug;
  Null image;
  Null yearEnd;
  int yearStart;
  int gamesCount;
  String imageBackground;

  Platform(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.yearEnd,
      this.yearStart,
      this.gamesCount,
      this.imageBackground});

  Platform.fromJson(Map<String, dynamic> json) {
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

class RequirementsEn {
  String minimum;
  String recommended;

  RequirementsEn({this.minimum, this.recommended});

  RequirementsEn.fromJson(Map<String, dynamic> json) {
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

class ParentPlatforms {
  PlatformforParent platform;

  ParentPlatforms({this.platform});

  ParentPlatforms.fromJson(Map<String, dynamic> json) {
    platform = json['platform'] != null
        ? new PlatformforParent.fromJson(json['platform'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.platform != null) {
      data['platform'] = this.platform.toJson();
    }
    return data;
  }
}

class PlatformforParent {
  int id;
  String name;
  String slug;

  PlatformforParent({this.id, this.name, this.slug});

  PlatformforParent.fromJson(Map<String, dynamic> json) {
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

class Genres {
  int id;
  String name;
  String slug;
  int gamesCount;
  String imageBackground;

  Genres(
      {this.id, this.name, this.slug, this.gamesCount, this.imageBackground});

  Genres.fromJson(Map<String, dynamic> json) {
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

class Stores {
  int id;
  Store store;
  String urlEn;
  String urlRu;

  Stores({this.id, this.store, this.urlEn, this.urlRu});

  Stores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
    urlEn = json['url_en'];
    urlRu = json['url_ru'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.store != null) {
      data['store'] = this.store.toJson();
    }
    data['url_en'] = this.urlEn;
    data['url_ru'] = this.urlRu;
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

class ShortScreenshots {
  int id;
  String image;

  ShortScreenshots({this.id, this.image});

  ShortScreenshots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}

class Filters {
  List<Years> years;

  Filters({this.years});

  Filters.fromJson(Map<String, dynamic> json) {
    if (json['years'] != null) {
      years = new List<Years>();
      json['years'].forEach((v) {
        years.add(new Years.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.years != null) {
      data['years'] = this.years.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Years {
  int from;
  int to;
  String filter;
  int decade;
  List<Year> years;
  bool nofollow;
  int count;

  Years(
      {this.from,
      this.to,
      this.filter,
      this.decade,
      this.years,
      this.nofollow,
      this.count});

  Years.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    filter = json['filter'];
    decade = json['decade'];
    if (json['years'] != null) {
      years = new List<Year>();
      json['years'].forEach((v) {
        years.add(new Year.fromJson(v));
      });
    }
    nofollow = json['nofollow'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    data['filter'] = this.filter;
    data['decade'] = this.decade;
    if (this.years != null) {
      data['years'] = this.years.map((v) => v.toJson()).toList();
    }
    data['nofollow'] = this.nofollow;
    data['count'] = this.count;
    return data;
  }
}

class Year {
  int year;
  int count;
  bool nofollow;

  Year({this.year, this.count, this.nofollow});

  Year.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    count = json['count'];
    nofollow = json['nofollow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['count'] = this.count;
    data['nofollow'] = this.nofollow;
    return data;
  }
}
