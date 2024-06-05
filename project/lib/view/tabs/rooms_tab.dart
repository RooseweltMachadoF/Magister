import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project/controller/rooms_controller.dart';
import 'package:project/model/usuario_model.dart';
import 'package:project/view/feed_room_page.dart';

import 'package:project/widgets/action_card.dart';

class RoomsScreen extends StatefulWidget {
  final UserModel currentUser;

  const RoomsScreen({super.key, required this.currentUser});

  @override
  _RoomsScreenState createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  late TextEditingController _searchController;
  late RoomsController _roomsController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _roomsController = RoomsController();
    _searchController.addListener(() {
      _roomsController.setSearchQuery(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 51, 102, 1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar sala...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Observer(
                builder: (_) {
                  return ListView.builder(
                    itemCount: _roomsController.filteredRooms.length,
                    itemBuilder: (context, index) {
                      final room = _roomsController.filteredRooms[index];
                      return ActionCard(
                        title: room.titulo,
                        description: room.descricao,
                        icon: Icons.book_outlined,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FeedScreen(
                                      salaModel:
                                          _roomsController.filteredRooms[index],
                                      currentUser: widget.currentUser,
                                    )),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
