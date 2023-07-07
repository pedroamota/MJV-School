class PokemonEntity {
  int uuid;
  String name;
  double height;
  double weight;
  List<String> types;
  String sprite;
  bool favorite;

  PokemonEntity({
    required this.uuid,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.sprite,
    this.favorite = false,
  });
}
