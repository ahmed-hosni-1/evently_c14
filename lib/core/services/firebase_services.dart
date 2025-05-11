import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c14/core/models/event_model.dart';

class FireBaseFireStoreServices {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static CollectionReference<EventModel> _getRefCollection() {
    return _firestore.collection("events").withConverter<EventModel>(
      fromFirestore: (snapshot, options) {
        return EventModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static Future<void> addEvent(EventModel event) async {
    var ref = _getRefCollection();
    var doc = ref.doc();
    event.id = doc.id;
    doc.set(event);
  }

  static Future<List<QueryDocumentSnapshot<EventModel>>> getEvents(
      String id) async {
    var ref = _getRefCollection();
    var data;
    if(id == "0"){
      data = await ref.get();
    }else{
      data = await ref.where("category_id", isEqualTo: id).get();

    }
    return data.docs;
  }
  static Stream<QuerySnapshot<EventModel>> getEventsRealTime(
      String id)  {
    var ref = _getRefCollection();
    if(id == "0"){
      return  ref.snapshots();
    }else{
    return ref.where("category_id", isEqualTo: id).snapshots();

    }
  }
}
