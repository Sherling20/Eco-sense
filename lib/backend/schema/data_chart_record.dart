import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DataChartRecord extends FirestoreRecord {
  DataChartRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "DocRef" field.
  List<DocumentReference>? _docRef;
  List<DocumentReference> get docRef => _docRef ?? const [];
  bool hasDocRef() => _docRef != null;

  void _initializeFields() {
    _docRef = getDataList(snapshotData['DocRef']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Data-Chart');

  static Stream<DataChartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DataChartRecord.fromSnapshot(s));

  static Future<DataChartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DataChartRecord.fromSnapshot(s));

  static DataChartRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DataChartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DataChartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DataChartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DataChartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DataChartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDataChartRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class DataChartRecordDocumentEquality implements Equality<DataChartRecord> {
  const DataChartRecordDocumentEquality();

  @override
  bool equals(DataChartRecord? e1, DataChartRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.docRef, e2?.docRef);
  }

  @override
  int hash(DataChartRecord? e) => const ListEquality().hash([e?.docRef]);

  @override
  bool isValidKey(Object? o) => o is DataChartRecord;
}
