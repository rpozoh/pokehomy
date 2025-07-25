import 'package:flutter/material.dart';
import 'package:pokehomy/data/pokemon_data_source.dart';
import 'package:pokehomy/data/generic_data.dart';

void showPokemonBanListModal(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Cerrar",
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    'Banea a tú Pokémon favorito',
                    style: TextStyle(
                      fontSize: 30,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 8
                        ..color = const Color(0xff3c5aa6),
                    ),
                  ),
                  // Solid text as fill.
                  const Text(
                    'Banea a tú Pokémon favorito',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xffffcb05),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Center(
                child: SizedBox(
                width: 400,
                child: PokemonBanListModal(),
              )),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    side: const BorderSide(width: 3)),
                child: const Text("Cerrar",
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      );
    });
  }

  class PokemonBanListModal extends StatefulWidget {
    const PokemonBanListModal({super.key});
  
    @override
    State<PokemonBanListModal> createState() {
      return _PokemonBanListModalState();
    }
}

class _PokemonBanListModalState extends State<PokemonBanListModal> {
  PokemonDataSource? _pokemonDataSource;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _banList();
  }

  Future<void> _banList() async {
    setState(() => _loading = true);
    final pokemonBanList = await updatePoke();
    _pokemonDataSource = PokemonDataSource(pokemonBanList, _banList);
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return _loading ? const Center(child: CircularProgressIndicator()) : _pokemonDataSource == null ? const Center(child: Text('No se pudieron cargar los datos')) :SingleChildScrollView(
      child: PaginatedDataTable(
        header: 
        Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            // Stroked text as border.
            Text(
              'Pokémon',
              style: TextStyle(
                fontSize: 20,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 8
                  ..color = const Color(0xff3c5aa6),
              ),
            ),
            // Solid text as fill.
            const Text(
              'Pokémon',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xffffcb05),
              ),
            ),
          ],
        ),
        columns: const [
          DataColumn(label: Text("Nombre", style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text("Estado", style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text("Banear", style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        source: _pokemonDataSource!,
        rowsPerPage: 10,
        columnSpacing: 20,
        showCheckboxColumn: true,
      ),
    );
  }
}
