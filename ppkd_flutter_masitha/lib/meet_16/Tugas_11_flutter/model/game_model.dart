import 'dart:convert';

class GameModel {
  final int? id;
  final String nama_pengguna;
  final String game;
  final String ulasan;
  final String genre;
  final String rating;
  GameModel({
    this.id,
    required this.nama_pengguna,
    required this.game,
    required this.ulasan,
    required this.genre,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama_pengguna': nama_pengguna,
      'game': game,
      'ulasan': ulasan,
      'genre': genre,
      'rating': rating,
    };
  }

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      id: map['id'] as int,
      nama_pengguna: map['nama_pengguna'] as String,
      game: map['game'] as String,
      ulasan: map['ulasan'] as String,
      genre: map['genre'] as String,
      rating: map['rating'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GameModel.fromJson(String source) =>
      GameModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
//ini hanya