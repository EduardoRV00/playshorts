import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideosRecord extends FirestoreRecord {
  VideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "imagem_thumbnail" field.
  String? _imagemThumbnail;
  String get imagemThumbnail => _imagemThumbnail ?? '';
  bool hasImagemThumbnail() => _imagemThumbnail != null;

  // "url_video" field.
  String? _urlVideo;
  String get urlVideo => _urlVideo ?? '';
  bool hasUrlVideo() => _urlVideo != null;

  // "duracao" field.
  String? _duracao;
  String get duracao => _duracao ?? '';
  bool hasDuracao() => _duracao != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _imagemThumbnail = snapshotData['imagem_thumbnail'] as String?;
    _urlVideo = snapshotData['url_video'] as String?;
    _duracao = snapshotData['duracao'] as String?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videos');

  static Stream<VideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosRecord.fromSnapshot(s));

  static Future<VideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosRecord.fromSnapshot(s));

  static VideosRecord fromSnapshot(DocumentSnapshot snapshot) => VideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideosRecordData({
  String? titulo,
  String? descricao,
  String? imagemThumbnail,
  String? urlVideo,
  String? duracao,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'descricao': descricao,
      'imagem_thumbnail': imagemThumbnail,
      'url_video': urlVideo,
      'duracao': duracao,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideosRecordDocumentEquality implements Equality<VideosRecord> {
  const VideosRecordDocumentEquality();

  @override
  bool equals(VideosRecord? e1, VideosRecord? e2) {
    return e1?.titulo == e2?.titulo &&
        e1?.descricao == e2?.descricao &&
        e1?.imagemThumbnail == e2?.imagemThumbnail &&
        e1?.urlVideo == e2?.urlVideo &&
        e1?.duracao == e2?.duracao &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(VideosRecord? e) => const ListEquality().hash([
        e?.titulo,
        e?.descricao,
        e?.imagemThumbnail,
        e?.urlVideo,
        e?.duracao,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is VideosRecord;
}
