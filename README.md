sqlite3pod
==========

The repository for the sqlite3 podspec in [CocoaPods](http://cocoapods.org).

Please refer to the [SQLite](https://www.sqlite.org) project if you encounter any problems related to SQLite itself: https://sqlite.org/support.html

**IMPORTANT**: If you are building SQLite 3.8.9 for iOS your build might fail due to an upstream bug in relation to `gethostuuid` (see [this issue](https://github.com/clemensg/sqlite3pod/issues/1)). The bug appeared in SQLite version 3.8.9, so you can either roll back to version 3.8.8.3 by specifying `pod 'sqlite3', '3.8.8.3'` in your Podfile or use the workaround `pod 'sqlite3', git: 'git@github.com:clemensg/sqlite3pod.git'` until the next version bump. Then the workaround will become available via `pod 'sqlite3'`.

Pull requests to improve this podspec are welcome.

This podspec is licensed under the MIT License.
All of the code and documentation in SQLite itself has been dedicated to the public domain by the authors: https://www.sqlite.org/copyright.html
