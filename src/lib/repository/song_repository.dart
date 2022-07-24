import '../exports.dart';

abstract class SongRepository {
  factory SongRepository(SongService service, SongDaoStorage storage) =
      _SongRepository;

  Stream<List<Song>> getSongs();

  Future<List<Song>> fetchSongs();

  Future<void> saveSong(Song song);

  Future<void> setSongState(Song song);
}

class _SongRepository implements SongRepository {
  final SongDaoStorage _songDao;
  final SongService _songService;

  _SongRepository(this._songService, this._songDao);

  @override
  Stream<List<Song>> getSongs() => _songDao
      .getAllSongsStream()
      .map((list) => list.map((item) => item.getModel()).toList());

  @override
  Future<List<Song>> fetchSongs() async {
    final results = await _songService.getSongs();
    for (final song in results) {
      await _songDao.createSongWithValue(song);
    }
    return results;
  }

  @override
  Future<void> saveSong(Song song) async {
    await _songDao.createSong(song);
  }

  @override
  Future<void> setSongState(Song song) async {
    await _songDao.updateSong(song);
  }
}
