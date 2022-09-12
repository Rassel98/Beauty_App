class ProductColorsModel {
  ProductColorsModel({
    this.hexValue,
    this.colourName,
  });

  ProductColorsModel.fromJson(dynamic json) {
    hexValue = json['hex_value'];
    colourName = json['colour_name'];
  }
  String? hexValue;
  String? colourName;
  ProductColorsModel copyWith({
    String? hexValue,
    String? colourName,
  }) =>
      ProductColorsModel(
        hexValue: hexValue ?? this.hexValue,
        colourName: colourName ?? this.colourName,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hex_value'] = hexValue;
    map['colour_name'] = colourName;
    return map;
  }
}