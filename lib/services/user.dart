import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> fetchData(email) async {
  // Reference to the Firestore collection
  CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  try {
    // Get the documents from the collection
    QuerySnapshot querySnapshot =
        await collection.where("email", isEqualTo: email).get();

    // Loop through the documents and access data
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      print(doc.data());
      // Access specific fields using doc.get('field_name')
    }
  } catch (e) {
    print('Error fetching data: $e');
  }
}
