// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //initialize firestore
  var db = FirebaseFirestore.instance;
  final username = '';

  DocumentReference? documentReference;

  List<String> downloadUrl = [];

  final user = FirebaseAuth.instance.currentUser != null ? FirebaseAuth.instance.currentUser : null;

  //tambah user
  Future createUserData(String userId) async {
    db.collection("users").doc(userId).set({
      'userId' : userId,
    });
  }

  Future AddNote(String title, String content) async{
    db.collection("notes").doc().set({
      'userId' : user?.uid,
      'title' : title,
      'content' : content,
      'createdAt' : DateTime.now()
    });
  }

  Future EditNote(String documentId, String title, String content) async{
    db.collection("notes").doc(documentId).update({
      'title' : title,
      'content' : content,
      'createdAt' : DateTime.now(),
    });
  }

  Future deleteNote(String documentId) async {
    return await db.collection("notes").doc(documentId).delete();
  }

//   Future<DocumentSnapshot> getUsers(String id) async {
//     return await db.collection("users").doc(id).get();
//   }

//   //tambah request
//   Future createRequest(List<Map<String, dynamic>> listBarang, String lokasi, num total) async{
//     int latestDocumentId = 0;  
//     int checkDocumentId = 0;  
//     String newDocumentId = '';
//     await db.collection('requests').doc('0latestDocumentId').get().then((value) {
//       if(value.data()!.length > 0) {
//         latestDocumentId = value.data()!["documentId"];
//         checkDocumentId = latestDocumentId~/10;
//         if(checkDocumentId <= 0) {
//           newDocumentId = 'r0000000' + (latestDocumentId+1).toString();
//         }
//         if(latestDocumentId > 9) {
//           newDocumentId = 'r000000' + (latestDocumentId+1).toString();
//         }
//         if(latestDocumentId > 99) {
//           newDocumentId = 'r00000' + (latestDocumentId+1).toString();
//         }
//         iteratePhoto(listBarang, newDocumentId, lokasi, total);
//       } else {
//         print('document id not found');
//       }
//     });

//     await db.collection('requests').doc('0latestDocumentId').update({
//       'documentId' : latestDocumentId+1
//     });
    
//     DocumentSnapshot documentUser = await db.collection("users").doc(uid).get();
//     dynamic jsonUser = documentUser.data();

//     await db.collection('requests').doc(newDocumentId).set({
//       'documentId' : newDocumentId,
//       'userId' : uid,
//       'namaUser' : jsonUser["username"],
//       'userPengepulId' : null,
//       'namaUserPengepul' : '',
//       'diambil' : false,
//       'selesai' : false,
//       'total' : total,
//       'lokasi' : lokasi,
//       'dibatalkan' : false,
//       'uploadFotoSelesai' : false,
//       'status' : 'mencari pengepul',
//       'tanggal' : DateTime.now(),
//       'listBarang' : [
//         for (var i = 0; i < listBarang.length; i++) {
//           'check' : false,
//           'kategori' : listBarang[i]["kategori"],
//           'namaBarang' : listBarang[i]["namaBarang"],
//           'deskripsi' : listBarang[i]["deskripsi"],
//           'harga' : listBarang[i]["harga"],
//           'hargaPerItem' : listBarang[i]["hargaPerItem"],
//           'berat' : listBarang[i]["berat"],
//           'fotoBarang' : '',
//         }
//       ],
//     });

//     return newDocumentId;
//   }

//   //iterate semua foto request 
//   Future iteratePhoto(List<Map<String, dynamic>> listBarang, String newDocumentId, String lokasi, num total) async{
//     for (var i = 0; i < listBarang.length; i++) {
//       await addRequestPhoto(listBarang[i]["fotoBarang"], i, listBarang, newDocumentId, lokasi, total);
//     }
//   }

//   //tambah foto request
//   Future addRequestPhoto(File imageFile, int index, List<Map<String, dynamic>> listBarang, String newDocumentId, String lokasi, num total) async {
//     String fileName = basename(imageFile.path);
//     FirebaseStorage storage = FirebaseStorage.instance;
//     Reference ref = storage.ref().child(fileName + DateTime.now().toString());
//     UploadTask uploadTask = ref.putFile(imageFile);
//     String url = '';
//     await uploadTask.whenComplete(() {
//       ref.getDownloadURL().then((fileUrl){
//         url = fileUrl;
//         listBarang[index]['fotoBarang'] = url;
//         print(listBarang);
//         db.collection('requests').doc(newDocumentId).update({
//           'uploadFotoSelesai' : true,
//           'listBarang' : [
//             for (var i = 0; i <= index; i++) {
//               'kategori' : listBarang[i]["kategori"],
//               'namaBarang' : listBarang[i]["namaBarang"],
//               'deskripsi' : listBarang[i]["deskripsi"],
//               'harga' : listBarang[i]["harga"],
//               'hargaPerItem' : listBarang[i]["hargaPerItem"],
//               'berat' : listBarang[i]["berat"],
//               'fotoBarang' : listBarang[i]['fotoBarang'],
//             }
//           ],
//         });
//       });
//     });
//     return url;
//   }

//   //batalkan request
//   Future cancelRequest(String documentId) async {
//     await db.collection('requests').doc(documentId).update({
//       'dibatalkan' : true
//     });
//     return 'dibatalkan berhasil';
//   }

//   //finish request dan tambah point
//   Future finishRequest(String documentId, num total) async{
//     //finsih request
//     await db.collection('requests').doc(documentId).update({
//       'selesai' : true,
//       'status' : 'selesai'
//     });

//     //ambil data poin user
//     DocumentSnapshot documentUser = await FirebaseFirestore.instance.collection('users').doc(uid).get(); 
//     dynamic jsonUser = documentUser.data();

//     //tambah poin
//     await db.collection('users').doc(uid).update({
//       'poin' : jsonUser["poin"]+(total~/10) 
//     });
//   }

//   //kasih rating
//   Future giveRating(String userPengepulId, num rating) async{
//     num ratingResult;
//     //ambil data user pengepul
//     DocumentSnapshot documentUserPengepul = await FirebaseFirestore.instance.collection('usersPengepul').doc(userPengepulId).get(); 
//     dynamic jsonUserPengepul = documentUserPengepul.data();
//     //cek banyaknya transaksi 
//     num jumlahTransactions = jsonUserPengepul["historyTransactions"].length;
//     //hitung rating
//     ratingResult = 
//     ((jsonUserPengepul["rating"]*(jumlahTransactions == 1 ? jumlahTransactions : jumlahTransactions-1))+rating)/jumlahTransactions;
//     //update rating di database  
//     await db.collection('usersPengepul').doc(userPengepulId).update({
//       'rating' : ratingResult
//     });
//   }
}