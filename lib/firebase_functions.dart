import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/tasks_model.dart';

class FirebaseFunction{


  static CollectionReference<TaskModel>getTasksCollection(){
  return FirebaseFirestore.instance
   .collection("Task")
       .withConverter<TaskModel>(
       fromFirestore:(snapshot,_) {
         return TaskModel.fromJson(snapshot.data()!);
       },

       toFirestore:(taskModel, _){
         return taskModel.toJson();

       },);

  }
  static Future<void> addTaskToFireStore(TaskModel task){
    var collection =getTasksCollection();
    var docRef= collection.doc();
    task.id=docRef.id;
    return docRef.set(task);


  }
  static Stream <QuerySnapshot<TaskModel>>getTaskFromFireStore(DateTime time){
    return getTasksCollection().where("time",isEqualTo: DateUtils.dateOnly(time).microsecondsSinceEpoch)
    .snapshots();
  }
 static Future<void> deleteTask(String id){
 return getTasksCollection().doc(id).delete();

  }
  static Future<void> updateTask(String id , TaskModel task){
    return getTasksCollection().doc(id).update(task.toJson());
  }


}