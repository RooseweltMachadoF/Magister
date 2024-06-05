import 'package:flutter/material.dart';
import 'package:project/controller/auth_controller.dart';
import 'package:project/model/usuario_model.dart';
import 'package:project/view/coordenador_page.dart';
import 'package:project/view/tabs/my_room_page.dart';

import 'package:project/view/tabs/profile_page.dart';
import 'package:project/view/tabs/rooms_tab.dart';
import 'package:project/view/terms_privacy_page.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  final UserModel currentUser;
  HomePage({Key? key, required this.currentUser}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final AuthController _authController = AuthController();

  late List<Widget> _widgetOptions;
  List<PopupMenuEntry> menu = [];

  @override
  void initState() {
    preencheMenu(widget.currentUser);
    _widgetOptions = <Widget>[
      RoomsScreen(
        currentUser: widget.currentUser,
      ),
      MyRoomsScreen(
        currentUser: widget.currentUser,
      ),
      ProfilePage(
        initialPage: true,
        user: widget.currentUser,
      ),
    ];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 51, 102, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(0, 51, 102, 1),
        actions: [
          PopupMenuButton(
            iconSize: 40,
            color: Colors.white,
            icon: const Icon(Icons.menu, color: Colors.white),
            itemBuilder: (BuildContext context) {
              return menu;
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.room),
            label: 'Salas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Minhas Salas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(0, 51, 102, 1),
        onTap: _onItemTapped,
      ),
    );
  }

  void preencheMenu(UserModel user) {
    if (user.permission == "coordinator") {
      menu.add(PopupMenuItem(
        child: const Text('Coordenador'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CoordinatorScreen(
                      emailUser: user.email,
                    )),
          );
        },
      ));
    }
    menu.addAll([
      PopupMenuItem(
        child: const Text('Meu perfil'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilePage(
                      initialPage: false,
                      user: widget.currentUser,
                    )),
          );
        },
      ),
      PopupMenuItem(
        child: const Text('Notificações'),
        onTap: () {
          // Adicione aqui a lógica para notificações
        },
      ),
      PopupMenuItem(
        child: const Text('Compartilhar'),
        onTap: () {
          _shareMessage("Baixe agora o SalaConnect");
        },
      ),
      PopupMenuItem(
        child: const Text('Termos de Uso e Privacidade'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TermsAndPrivacyPage()),
          );
        },
      ),
      PopupMenuItem(
        child: const Text('Sair'),
        onTap: () async {
          await _authController.signOut();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => TermsAndPrivacyPage()),
          );
        },
      ),
    ]);
  }
}

void _shareMessage(String message) {
  Share.share(message);
}
