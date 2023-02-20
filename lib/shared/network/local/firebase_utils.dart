import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/task.dart';

CollectionReference<Task> getCollection() {
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

Stream<QuerySnapshot<Task>> getTasksFromFireStore(DateTime dateTime) {
  return getCollection()
      .where("date",
          isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
      .snapshots();
}

Future<void> deleteTaskFromFireStore(String id) {
  return getCollection().doc(id).delete();
}

Future<void> updateTask(Task task ) {
  return getCollection().doc(task.id).update(
   task.toJson()
  );
}
Future<void> isDoneTask(String id,bool isDone) async{
  return await getCollection().doc(id).update({
    'isDone':isDone
  });
}
