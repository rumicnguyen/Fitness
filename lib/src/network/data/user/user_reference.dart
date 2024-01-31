import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/network/firebase/base_collection.dart';
import 'package:fitness_app/src/network/model/common/result.dart';
import 'package:fitness_app/src/network/model/user/user.dart';


class UserReference extends BaseCollectionReference<MUser> {
  UserReference()
      : super(
          FirebaseFirestore.instance.collection('user').withConverter<MUser>(
                fromFirestore: (snapshot, options) =>
                    MUser.fromJson(snapshot.data() as Map<String, dynamic>),
                toFirestore: (chatRoom, _) => chatRoom.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Future<MResult<MUser>> addUser(MUser user) async {
    try {
      final result = await get(user.id);
      if (result.isSuccess == true) {
        return MResult.error('User already exists');
      } else {
        final MResult<MUser> result = await add(user);
        return MResult.success(result.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<MUser>> getOrAddUser(MUser user) async {
    try {
      final result = await get(user.id);
      if (result.isSuccess == true) {
        return MResult.success(result.data);
      } else {
        final MResult<MUser> result = await set(user);
        return MResult.success(result.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MUser>>> getUsers() async {
    try {
      final QuerySnapshot<MUser> query =
          await ref.get().timeout(const Duration(seconds: 10));
      final docs = query.docs.map((e) => e.data()).toList();
      return MResult.success(docs);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
