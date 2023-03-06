class ShowsModel {
  ShowsModel(
      {required this.idnumber,
      required this.title,
      required this.videourl,
      required this.imageurl,
      required this.brand,
      required this.show,
      required this.date});

  late final int idnumber;
  late final String title;
  late final String videourl;
  late final String imageurl;
  late final String brand;
  late final String show;
  late final String date;

  ShowsModel.fromJson(Map<String, dynamic> json) {
    idnumber = json['idnumber'];
    title = json['title'];
    videourl = json['videourl'];
    imageurl = json['imgurl'];
    brand = json['brand'];
    show = json['show'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['idnumber'] = idnumber;
    _data['title'] = title;
    _data['videourl'] = videourl;
    _data['imgurl'] = imageurl;
    _data['brand'] = brand;
    _data['show'] = show;
    _data['date'] = date;

    return _data;
  }
}
