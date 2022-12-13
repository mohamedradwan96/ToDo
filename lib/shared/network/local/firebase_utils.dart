import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/task.dart';

CollectionReference getCollection() {
  return FirebaseFirestore.instance.collection("Tasks").withConverter<Task>(
        fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );
}

Future<void> addTasksToFireStore(Task task) {
  var collection = getCollection();
  var docRef = collection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}
