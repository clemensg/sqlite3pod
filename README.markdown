sqlite3pod
==========

The repository for the sqlite3 podspec in [CocoaPods](http://cocoapods.org).

Please refer to the [SQLite](https://www.sqlite.org) project if you encounter any problems related to SQLite itself: https://sqlite.org/support.html

Changelog: https://www.sqlite.org/news.html

Pull requests to improve this podspec are welcome.

## Usage

To use SQLite in your project, add `pod 'sqlite3'` to your Podfile. However, as clang reports many (mostly harmless) warnings, which need to be fixed upstream, you probably want to use `pod 'sqlite3', inhibit_warnings: true`. You do not have to add it to every subspec you use (e.g. `pod 'sqlite3/fts'`), adding the parameter to the main pod is sufficient.


## Subspecs

- [API Armor, detects API misuse during development](https://sqlite.org/compile.html#enable_api_armor): `pod 'sqlite3/api_armor'`
- [Bytecode() And Tables_Used() Table-Valued Functions](https://www.sqlite.org/bytecodevtab.html): `pod 'sqlite3/bytecodevtab'`
- [Column Metadata Access](https://sqlite.org/compile.html#enable_column_metadata): `pod 'sqlite3/coldata'`
- [Full-Text-Search (FTS3/4)](https://www.sqlite.org/fts3.html): `pod 'sqlite3/fts'`
- [Full-Text-Search (FTS5)](https://www.sqlite.org/fts5.html): `pod 'sqlite3/fts5'`
- [Geopoly](https://sqlite.org/geopoly.html): `pod 'sqlite3/geopoly'`
- [JSON Support](https://www.sqlite.org/json1.html): `pod 'sqlite3/json1'` (Built-in since 3.38.0)
- [Performance](https://sqlite.org/compile.html#rcmd): `pod 'sqlite3/perf'`
  (This subspec sets compile-time options recommended by the SQLite docs for increased performance and reduced memory usage. As it disables thread-safety logic, shared-cache mode, etc., make sure your application is able to use it and does not access SQLite from more than one thread at a time)
- [Performance](https://sqlite.org/compile.html#rcmd) (**Threadsafe**): `pod 'sqlite3/perf-threadsafe'`
  (This subspec sets the same recommended compile-time options as above except keeping thread-safety logic and shared-cache mode enabled)
- [Resumable Bulk Update](https://www.sqlite.org/rbu.html): `pod 'sqlite3/rbu'`
- [R*-Tree index for range queries](https://www.sqlite.org/rtree.html): `pod 'sqlite3/rtree'`
- [Historical Snapshots](https://www.sqlite.org/c3ref/snapshot.html): `pod 'sqlite3/snapshot'`
- [Session Extension](https://www.sqlite.org/sessionintro.html): `pod 'sqlite3/session'`
- [Soundex](https://www.sqlite.org/lang_corefunc.html#soundex): `pod 'sqlite3/soundex'`
- [Spellfix1](https://www.sqlite.org/spellfix1.html): `pod 'sqlite3/spellfix1'`
- [STAT4 Enhanced ANALYZE and query planner](https://sqlite.org/compile.html#enable_stat4): `pod 'sqlite3/stat4'`
- [Unlock-Notify API](https://www.sqlite.org/unlock_notify.html): `pod 'sqlite3/unlock_notify'`
- [DBSTAT](https://www.sqlite.org/dbstat.html): `pod 'sqlite3/dbstatvtab'`

## License

This podspec is licensed under the MIT License.

All of the code and documentation in SQLite itself has been dedicated to the public domain by the authors: https://www.sqlite.org/copyright.html
