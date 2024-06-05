import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/post_model.dart';

class SalaModel {
  String id;
  String titulo;
  String descricao;
  List<String> usuarios;
  List<Post> feed;

  SalaModel({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.usuarios,
    required this.feed,
  });

  factory SalaModel.fromDocument(DocumentSnapshot doc) {
    return SalaModel(
      id: doc.id,
      titulo: doc['titulo'] ?? 'Sem Título',
      descricao: doc['descricao'] ?? 'Sem Descrição',
      usuarios: List<String>.from(doc['usuarios'] ?? []),
      feed: (doc['feed'] as List<dynamic>?)
              ?.map((item) => Post.fromMap(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'descricao': descricao,
      'usuarios': usuarios,
      'feed': feed.map((post) => post.toMap()).toList(),
    };
  }
}
