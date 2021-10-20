class WalpaperModel {
  WalpaperModel(
      {this.photographer,
      this.photographer_url,
      this.photographer_id,
      this.src});

  final String? photographer;
  final String? photographer_url;
  final int? photographer_id;
  final SrcModel? src;

  factory WalpaperModel.Map(Map<String, dynamic> jsonData) {
    return WalpaperModel(
      photographer: jsonData["photographer"],
      photographer_url: jsonData["photographer_url"],
      photographer_id: jsonData["photographer_id"],
      src: SrcModel.fromMap(jsonData["src"]),
    );
  }
}

class SrcModel {
  final String? original;
  final String? small;
  final String? portrait;

  SrcModel({this.original, this.small, this.portrait});
  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
      portrait: jsonData["portrait"],
      original: jsonData["original"],
      small: jsonData["small"],
    );
  }
}
