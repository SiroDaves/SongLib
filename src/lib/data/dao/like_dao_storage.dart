import 'package:drift/drift.dart';

import '../../exports.dart';

part 'like_dao_storage.g.dart';

abstract class LikeDaoStorage {
  factory LikeDaoStorage(MyDatabase db) = _LikeDaoStorage;

  Stream<List<DbLike>> getAllLikesStream();

  Future<List<Like>> getAllLikes();

  Future<void> createLike(Like like);
}

@DriftAccessor(tables: [
  DbLikeTable,
])
class _LikeDaoStorage extends DatabaseAccessor<MyDatabase>
    with _$_LikeDaoStorageMixin
    implements LikeDaoStorage {
  _LikeDaoStorage(MyDatabase db) : super(db);

  @override
  Future<List<Like>> getAllLikes() async {
    List<DbLike> dbLikes = await select(db.dbLikeTable).get();
    List<Like> likes = [];

    for (int i = 0; i < dbLikes.length; i++) {
      likes.add(
        Like(
          id: dbLikes[i].id,
          objectId: dbLikes[i].objectId,
          song: dbLikes[i].song,
          createdAt: dbLikes[i].createdAt,
        ),
      );
    }
    return likes;
  }

  @override
  Stream<List<DbLike>> getAllLikesStream() => select(db.dbLikeTable).watch();

  @override
  Future<void> createLike(Like like) => into(db.dbLikeTable).insert(
        DbLikeTableCompanion.insert(
          objectId: like.objectId,
          song: Value(like.song),
          createdAt: like.createdAt,
        ),
      );

}
