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
  int? editingId;

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
        id: editingId,
        nama_pengguna: namaController.text,
        game: gameController.text,
        ulasan: ulasanController.text,
        genre: genreController.text,
        rating: ratingController.text,
      );

      await DbHelper1.insertGame(newGame);

      // Tampilkan snackbar setelah data tersimpan
      if (editingId == null) {
        await DbHelper1.insertGame(newGame);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data berhasil disimpan!'),
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green[600],
          ),
        );
      } else {
        await DbHelper1.updateGame(newGame);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data berhasil diupdate!'),
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.blue[600],
          ),
        );
      }

      clearform();

      muatData();
    }
  }

  void clearform() {
    namaController.clear();
    gameController.clear();
    ulasanController.clear();
    genreController.clear();
    ratingController.clear();
    editingId = null;
  }

  Future<void> hapusData(int id) async {
    await DbHelper1.deleteGame(id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data berhasil dihapus!'),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red[600],
      ),
    );
    muatData();
  }

  void mulaiEdit(GameModel game) {
    setState(() {
      editingId = game.id;
      namaController.text = game.nama_pengguna;
      gameController.text = game.game;
      ulasanController.text = game.ulasan;
      genreController.text = game.genre;
      ratingController.text = game.rating;
    });
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

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: simpanData,
                      child: Text(editingId == null ? 'Simpan' : 'Update'),
                    ),
                  ),
                  if (editingId != null) ...[
                    const SizedBox(width: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        clearform();
                        setState(() {}); // refresh UI supaya tombol berubah
                      },
                      child: const Text('Batal'),
                    ),
                  ],
                ],
              ),

              const Divider(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: pendataanGameFav.length,
                  itemBuilder: (context, index) {
                    final game = pendataanGameFav[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              game.game,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('User: ${game.nama_pengguna}'),
                            Text('Genre: ${game.genre}'),
                            Text('Rating: ${game.rating}'),
                            Text('Ulasan: ${game.ulasan}'),
                            const SizedBox(height: 12),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    mulaiEdit(game);
                                  },
                                  child: const Text('Edit'),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  onPressed: () {
                                    hapusData(game.id!);
                                  },
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
