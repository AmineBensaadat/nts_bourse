class Fav {
  final String favName;
  final String vol;
  final double variation;
  final double lastPrice;
  final bool is_Fav;

  const Fav(
      {required this.favName,
      required this.vol,
      required this.variation,
      required this.lastPrice,
      required this.is_Fav});

  Fav copy(
          {String? favName,
          String? vol,
          double? variation,
          double? lastPrice,
          bool? is_Fav}) =>
      Fav(
        favName: favName ?? this.favName,
        vol: vol ?? this.vol,
        variation: variation ?? this.variation,
        lastPrice: lastPrice ?? this.lastPrice,
        is_Fav: is_Fav ?? this.is_Fav,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fav &&
          runtimeType == other.runtimeType &&
          favName == other.favName &&
          vol == other.vol &&
          variation == other.variation &&
          lastPrice == other.lastPrice &&
          is_Fav == other.is_Fav;

  @override
  int get hashCode =>
      favName.hashCode ^ vol.hashCode ^ variation.hashCode ^ lastPrice.hashCode;
}
