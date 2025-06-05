import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/meet_16/Tugas_11_flutter/database/db_helper.dart';
import 'package:ppkd_flutter_masitha/meet_16/Tugas_11_flutter/model/game_model.dart';

class GameFavorite extends StatefulWidget {
  const GameFavorite({super.key});
  static const String id = '/pendataan_game';

  @override
  _GameFavoriteState createState() => _GameFavoriteState();
}

class _GameFavoriteState extends State<GameFavorite> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController gameController = TextEditingController();
  final TextEditingController ulasanController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<GameModel> pendataanGameFav = [];

  @override
  void initState() {
    super.initState();
    muatData();
  }

  Future<void> muatData() async {
    final data = await DbHelper1.getAllGame();
    setState(() {
      pendataanGameFav = data;
    });
  }

  Future<void> simpanData() async {
    if (_formKey.currentState!.validate()) {
      final newGame = GameModel(
        id: 0,
        nama_pengguna: namaController.text,
        game: gameController.text,
        ulasan: ulasanController.text,
        genre: genreController.text,
        rating: ratingController.text,
      );

      await DbHelper1.insertGame(newGame);
      namaController.clear();
      gameController.clear();
      ulasanController.clear();
      genreController.clear();
      ratingController.clear();
      muatData();
    }
  }

  @override
  void dispose() {
    namaController.dispose();
    gameController.dispose();
    ulasanController.dispose();
    genreController.dispose();
    ratingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pendataan Game Favorit',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: const Color(0xff9B7EBD),
        leading: const Icon(Icons.videogame_asset, color: Color(0xff0E2148)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(namaController, 'Nama Pengguna'),
              _buildTextField(gameController, 'Nama Game'),
              _buildTextField(ulasanController, 'Ulasan'),
              _buildTextField(genreController, 'Genre'),
              _buildTextField(ratingController, 'Rating', isNumber: true),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: simpanData,
                child: const Text('Simpan'),
              ),
              const Divider(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: pendataanGameFav.length,
                  itemBuilder: (context, index) {
                    final game = pendataanGameFav[index];
                    return ListTile(
                      leading: CircleAvatar(child: Text('${game.id}')),
                      title: Text(game.game),
                      subtitle: Text(
                        'User: ${game.nama_pengguna}\n' // biar kebawah
                        'Genre: ${game.genre}\n'
                        'Rating: ${game.rating}\n'
                        'Ulasan: ${game.ulasan}',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField(
  TextEditingController controller,
  String label, {
  bool isNumber = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label wajib diisi';
        }

        if (isNumber && double.tryParse(value) == null) {
          return '$label harus berupa angka';
        }

        return null;
      },
    ),
  );
}
