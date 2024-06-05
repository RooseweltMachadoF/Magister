import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project/controller/my_rooms_controller.dart';
import 'package:project/model/usuario_model.dart';
import 'package:project/view/feed_room_page.dart';
import 'package:project/widgets/action_card.dart';

class MyRoomsScreen extends StatefulWidget {
  final UserModel currentUser;

  MyRoomsScreen({super.key, required this.currentUser});

  @override
  State<MyRoomsScreen> createState() => _MyRoomsScreenState();
}

class _MyRoomsScreenState extends State<MyRoomsScreen> {
  late TextEditingController _searchController;

  late MyRoomsController _myroomsController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _myroomsController = MyRoomsController(email: widget.currentUser.email);
    _searchController.addListener(() {
      _myroomsController.setSearchQuery(_searchController.text);
    });
  }

  @override
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
                    itemCount: _myroomsController.filteredRooms.length,
                    itemBuilder: (context, index) {
                      final room = _myroomsController.filteredRooms[index];
                      return ActionCard(
                        title: room.titulo,
                        description: room.descricao,
                        icon: Icons.book_outlined,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FeedScreen(
                                      salaModel: _myroomsController
                                          .filteredRooms[index],
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
