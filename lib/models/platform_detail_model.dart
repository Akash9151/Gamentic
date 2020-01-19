class PlatformDetail {
  int id;
  String name;
  String imageBackground;
  String description;

  PlatformDetail(
      {this.id,
      this.name,
      this.imageBackground,
      this.description,});

  PlatformDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageBackground = json['image_background'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_background'] = this.imageBackground;
    data['description'] = this.description;
    return data;
  }
}
